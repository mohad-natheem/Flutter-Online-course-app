import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_event.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_state.dart';
import 'package:online_learning_app/pages/sign_in/signin_controller.dart';
import '../common_widgets.dart';
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc,SignInState>(
      builder:(context,state){
        return  Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: BuildAppBar("Log In"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildThirdPartyLogin(context),
                Center(child: ReusableText("Or use your email account login")),
                Container(
                  margin: EdgeInsets.only(top: 66.h,left: 20.w,right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText("Email"),
                      SizedBox(height: 5.h,),
                      BuildTextField("Enter your email address","email","user",
                      (value){
                        context.read<SignInBloc>().add(EmailEvent(value));
                      }
                      ),
                      ReusableText("Password"),
                      SizedBox(height: 5.h,),
                      BuildTextField("Enter your password","password","lock",
                      (value){
                        context.read<SignInBloc>().add(PasswordEvent(value));
                      }
                      ),
                      forgotPassword(),
                      BuildLoginAndRegisterButton("Login", "login",
                      (){
                        // print("Login button");
                        SignInController(context: context).handleSignIn("email");
                      }
                      ),
                      BuildLoginAndRegisterButton("Sign Up", "register",
                      (){
                        Navigator.of(context).pushNamed("/register");

                      }
                      ),                     

                    ],
                    ),
                )

              ],

            ),
          ),
        )
        ),
    );
      } 
    );
  }


}
