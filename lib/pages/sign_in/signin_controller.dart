import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:online_learning_app/common/entities/entities.dart';
import 'package:online_learning_app/common/values/constants.dart';
import 'package:online_learning_app/common/widgets/flutter_toast.dart';
import 'package:online_learning_app/global.dart';
import 'package:online_learning_app/pages/home/home_controller.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_state.dart';
import 'package:online_learning_app/pages/sign_in/widgets/sign_in_widgets.dart';

import '../../common/apis/user_api.dart';

class SignInController{
  final BuildContext context;
  SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try{
      if(type=="email"){
        final state = context.read<SignInBloc>().state;
        String email = state.email;
        String password = state.password;

        if(email.isEmpty){
          // print("Email is empty");
          toastInfo(msg: "Fill in your email");
          return;

        }
        if(password.isEmpty){
          // print("password is empty");
          toastInfo(msg: "Fill in your password");
          return;

        }
        try{
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

          if(credential.user==null){
            // print("user does not exist");
            toastInfo(msg: "User doesn't exist");
            return;

          } 
          if(!credential.user!.emailVerified){
            // print("not varied");
            toastInfo(msg: "Verify your email");
            return;
            
          }
          var user = credential.user;
          if(user!=null){
            // print("user exist");
            String? name= user.displayName;
            String? email = user.email;
            String? id= user.uid;
            String? avatar = user.photoURL;
            print("open_id ${id}");
            print("My photourl is ${avatar}");

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar=avatar;
            loginRequestEntity.name=name;
            loginRequestEntity.email=email;
            loginRequestEntity.open_id=id;

            //type 1 means email login
            loginRequestEntity.type=1;

            toastInfo(msg: "User exist");
            asyncPostAllData(loginRequestEntity);
            
            
            
            // we got verified user from firebase
          }else{
            // print("no user");
            toastInfo(msg: "User doesn't exist");
            return;
            // we got error getting user from firebase
          }

        }on FirebaseAuthException catch(e){
          if(e.code=='user-not-found'){
            toastInfo(msg: "User not found");

          }else if(e.code == 'wrong-password'){
            // print('Wrong password provided for that user .');
            toastInfo(msg: "Wrong password");
          }else if(e.code=='invalid-email'){
            // print("Your email format is wrong");
            toastInfo(msg: "Your email format is wrong");
          }

        }

      }

    }catch(e){

    }
  }
  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true

    );
    try{
    var result = await UserAPI.login(params:loginRequestEntity);
    if(result.code==200){

      Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
      Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY,result.data!.access_token!);
      print('User token after sign in ${Global.storageService.getUserToken()}');
      if(context.mounted){
              print("Course list api called");
              await HomeController(context: context).init();
              
            }
      EasyLoading.dismiss();
      if(context.mounted){
        Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
      }

    }else{
      EasyLoading.dismiss();
      toastInfo(msg: "Unknown Error");
    }
    } 
    catch(e){
      print("Error with storage services ${e.toString()}");

    }
    }
    
  }
