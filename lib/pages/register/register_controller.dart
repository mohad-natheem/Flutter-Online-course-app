import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/common/values/constants.dart';
import 'package:online_learning_app/common/widgets/flutter_toast.dart';
import 'package:online_learning_app/pages/register/bloc/register_bloc.dart';

class RegisterController{
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if(userName.isEmpty){
      toastInfo(msg: "User name must not be empty!");
      return;
    }
    if(email.isEmpty){
      toastInfo(msg: "Email must not be empty!");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "Password must not be empty!");
      return;
    }
    if(rePassword.isEmpty){
      toastInfo(msg: "Re-enter your password");
      return;

    }
    try {
      final Credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password);
      if(Credential.user!=null){
        await Credential.user?.sendEmailVerification();
        await Credential.user?.updateDisplayName(userName);
        String photoUrl = "uploads/headpic.png";
        await Credential.user?.updatePhotoURL(photoUrl);
        
        toastInfo(msg: "An email has been sent your registered email , click on the link to verify your email address");
        Navigator.of(context).pop();
      }

    }on FirebaseAuthException catch(e){
      if(e.code=="invalid-email"){
        toastInfo(msg: "Invalid email address");
      }
      if(e.code=="weak-password"){
        toastInfo(msg: "Password is too weak");
      }
      if(e.code=="email-already-in-use"){
        toastInfo(msg: "Email already registered");
      }
 
      }
    } 
  }
