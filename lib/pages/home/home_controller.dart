import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/common/apis/course_api.dart';
import 'package:online_learning_app/global.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_events.dart';

import '../../common/entities/user.dart';

class HomeController{
  late BuildContext context;
  UserItem get userProfile => Global.storageService.getUserProfile();

  static final HomeController _singleton = HomeController._external();
  HomeController._external();

  factory HomeController({required BuildContext context}){
    print('Home');
    _singleton.context=context;
    return _singleton;
  }

  

  Future<void> init()async{
    print("Entered init method");
    print('User token when init is called ${Global.storageService.getUserToken()}');

   if(Global.storageService.getUserToken().isNotEmpty){
    print("Init method called"); 
    var result =await CourseAPI.courseList();
    print('Course list is ${result}');
    print("HomeControlle initialized");
    print('Result ${result}');
    if(result.code==200){
      if(context.mounted){
       context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
      }
      // print(result.data![0].name);
    }else{
      print(result.code);
    }}
    print("Home controller initialised");
    
  }
}