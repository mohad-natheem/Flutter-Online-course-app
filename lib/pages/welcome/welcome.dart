import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/values/colors.dart';
import 'package:online_learning_app/global.dart';
import 'package:online_learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:online_learning_app/pages/welcome/bloc/welcome_events,.dart';
import 'package:online_learning_app/pages/welcome/bloc/welcome_states.dart';

import '../../common/values/constants.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pagecontroller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc,WelcomeState>(
          builder:(context,state){
          return  Container(
          margin: EdgeInsets.only(top: 45.w),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                controller: pagecontroller,
                onPageChanged: (index){
                  state.page= index;
                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());

                },
                children: [
                  _page(
                    context,
                    1,
                    "First See Learning",
                    "Forget about a for of paper all knowledge in one learning",
                    "next",
                    "assets/images/reading.png"
                    ),
                  _page(
                    context,
                    2,
                    "Connect with everyone",
                    "Always keep in touch with your tutor & friend . let's get connected!",
                    "next",
                    "assets/images/boy.png"),
                  _page(
                    context,
                    3,
                    "Always Fascinated Learning",
                    "Anywhere, anytime. The time is at your discretion so study whenever you want.",
                    "start",
                    "assets/images/man.png"),
                 
                ],
              ),
              Positioned(
                
                bottom: 80.h,
                child:DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.center,
                  dotsCount: 3,
                  position: state.page,
                  decorator: DotsDecorator(
                    color: AppColors.primaryThreeElementText,
                    activeColor: AppColors.primaryElement,
                    size: Size.square(8.0),
                    activeSize: Size(18.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(5.0))
                   ),
                  ) )
            ],
          ),
        );
          } ,)
      ),
    );
  }
  Widget _page(BuildContext context,int index ,String title , String subtitle, String button_name ,String image_path){
    return Column(
                    children: [
                      SizedBox(
                    width: 345.w,
                    height: 345.w,
                    child: Image.asset(image_path,fit: BoxFit.cover,)
                  ),
                  Container(
               
                    child: Text(
                    title,
                    style: TextStyle(
                      color:AppColors.primaryText,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.normal
                    ),),

                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14.w),
                    width: 375.w,
                    padding: EdgeInsets.only(left: 30.w,right: 30.w),
                    child: Text(
                   subtitle,
                    style: TextStyle(
                      color: AppColors.primarySecondaryElementText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal
                    ),),

                  ),
                  GestureDetector(
                    onTap: ()=>{
                      if(index<3){
                        pagecontroller.animateToPage(index,duration: Duration(milliseconds: 500), curve: Curves.decelerate)

                      }
                      else{
                        //Navigator.of(context).push(MaterialPageRoute(builder:(context)=>MyHomePage()))
                        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true),
                        Navigator.of(context).pushNamedAndRemoveUntil("/sign_in",(route)=>false)

                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 100.h,left: 25.h,right: 25.h),
                      width: 325.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        color:AppColors.primaryElement,
                        borderRadius: BorderRadius.circular(10.w),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1)
                          )
                        ]
                      ),
                      child: Center(
                        child: Text(button_name,
                        style: TextStyle(
                          color: AppColors.primaryBackground,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal
                        ),
                        ),
                      ),
                    ),
                  )
                    ],
                  );
  }
}