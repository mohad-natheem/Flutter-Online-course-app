import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/pages/register/bloc/register_bloc.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:online_learning_app/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders => [
    BlocProvider(
    create: (context) => WelcomeBloc() ,
    lazy: false,
          ),
  //  BlocProvider(
  //   create: (context) => AppBlocs() ,
  //         ),
   BlocProvider(
    create: (context)=>SignInBloc(),
    lazy: false,
          ),
    
   BlocProvider(
    create: (context)=>RegisterBloc(),
    lazy: false,
    )


  ];
 }