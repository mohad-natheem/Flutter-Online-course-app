import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/common/routes/names.dart';
import 'package:online_learning_app/global.dart';
import 'package:online_learning_app/pages/application/application_page.dart';
import 'package:online_learning_app/pages/application/bloc/app_blocs.dart';
import 'package:online_learning_app/pages/course_detail/bloc/course_detail_blocs.dart';
import 'package:online_learning_app/pages/course_detail/course_detail.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:online_learning_app/pages/home/home_page.dart';
import 'package:online_learning_app/pages/profile/settings/bloc/settings_page_blocs.dart';
import 'package:online_learning_app/pages/profile/settings/settings_page.dart';
import 'package:online_learning_app/pages/register/bloc/register_bloc.dart';
import 'package:online_learning_app/pages/register/register.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:online_learning_app/pages/sign_in/sign_in.dart';
import 'package:online_learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:online_learning_app/pages/welcome/welcome.dart';

class AppPages{
  static List<PageEntity> routes(){
    return [
    PageEntity(
      route: AppRoutes.INITIAL, 
      page: Welcome(), 
      bloc: BlocProvider(create: (_)=>WelcomeBloc(),)
      ),
      PageEntity(
      route: AppRoutes.SIGN_IN, 
      page: SignIn(), 
      bloc: BlocProvider(create: (_)=>SignInBloc())
      ),
      PageEntity(
      route: AppRoutes.REGISTER, 
      page: Register(), 
      bloc: BlocProvider(create: (_)=>RegisterBloc())
      ),
      PageEntity(
      route: AppRoutes.APPLICATION, 
      page: ApplicationPage(), 
      bloc: BlocProvider(create: (_)=>AppBlocs())
      ),
      PageEntity(
      route: AppRoutes.HOMEPAGE, 
      page: HomePage(), 
      bloc: BlocProvider(create: (_)=>HomePageBlocs())
      ),
      PageEntity(
      route: AppRoutes.SETTINGS, 
      page: SettingsPage(), 
      bloc: BlocProvider(create: (_)=>SettingsPageBlocs())
      ),
      PageEntity(
      route: AppRoutes.COURSE_DETAIL, 
      page: CourseDetail(), 
      bloc: BlocProvider(create: (_)=>CourseDetailBlocs())
      ),

  ];
  }

  static List<dynamic> allBlocProviders(BuildContext context){
  List<dynamic> blocProviders = <dynamic>[];
  for(var bloc in routes()){
    blocProviders.add(bloc.bloc);
    
  }
  print(blocProviders);
  return blocProviders;

}

static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
  if(settings.name!=null){
    var result = routes().where((element) => element.route==settings.name);
    if(result.isNotEmpty){
      bool deviceFirstOpen= Global.storageService.getDeviceFirstOpen();
      if(result.first.route==AppRoutes.INITIAL&&deviceFirstOpen){
        bool isLogged = Global.storageService.isLoggedIn();
        if(isLogged){
          return MaterialPageRoute(builder: (_)=>const ApplicationPage(),settings: settings);
        } 


        return MaterialPageRoute(builder: (_)=>const SignIn(),settings: settings);
      }
      return MaterialPageRoute(builder: (_)=>result.first.page,settings: settings);
    }
    
  }
  print("Invalid route ${settings.name}");
  return MaterialPageRoute(builder: (_)=> const SignIn(),settings:settings );

}

}

class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route,required this.page,this.bloc});

}