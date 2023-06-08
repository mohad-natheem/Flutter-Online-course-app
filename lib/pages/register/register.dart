import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/pages/register/bloc/register_bloc.dart';
import 'package:online_learning_app/pages/register/bloc/register_states.dart';
import 'package:online_learning_app/pages/register/bloc/regiter_events.dart';
import 'package:online_learning_app/pages/register/register_controller.dart';

import '../common_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<RegisterBloc,RegisterStates>(
      builder: (context, state){
        return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: BuildAppBar("Sign Up"),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:30.h ,),
                Center(child: ReusableText("Fill  your details below and free sign up")),
                Container(
                  margin: EdgeInsets.only(top: 45.h,left: 20.w,right: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText("User name"),
                    
                      BuildTextField("Enter your user name","name","user",
                      (value){
                        context.read<RegisterBloc>().add(UserNameEvent(value));
                      }
                      ),
                      ReusableText("Email"),
                    
                      BuildTextField("Enter your email address","email","user",
                      (value){
                        context.read<RegisterBloc>().add(EmailEvent(value));
                      }
                      ),
                      ReusableText("Password"),
           
                      BuildTextField("Enter your password","password","lock",
                      (value){
                       context.read<RegisterBloc>().add(PasswordEvent(value));
                      }
                      ),
                      ReusableText("Confirm password"),
           
                      BuildTextField("Re-enter your password to confirm","password","lock",
                      (value){
                       context.read<RegisterBloc>().add(RePasswordEvent(value));
                      }
                      ),
                      ReusableText("By creating an account you have to agree with our terms and conditions"),
                      
                   
                      BuildLoginAndRegisterButton("Sign Up", "login",
                      (){
                        RegisterController(context: context).handleEmailRegister();

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