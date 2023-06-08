import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/routes/names.dart';
import 'package:online_learning_app/common/values/colors.dart';
import 'package:online_learning_app/common/widgets/base_text_widget.dart';

AppBar buildAppBar(){
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 12.h,
            width: 18.w,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Container(
            child: reusableText("Profile")
          ),
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),

        ],
      ),
    ),
  );
}
Widget profileIcon(){
  return Container(
              padding: EdgeInsets.only(right: 5.w,bottom: 5.w),
              alignment: Alignment.bottomRight,
              child: Image(
                height: 25.h,
                width: 25.w,
                image:AssetImage('assets/icons/edit_3.png') ),
              height: 80.h,
              width: 80.w,
              decoration:const BoxDecoration(
                image: DecorationImage(
                image:AssetImage('assets/icons/headpic.png') ),)
            );
}

var imagesInfo = <String,String>{
  "Settings":"settings.png",
  "Payment details":"credit-card.png",
  "Achievement":"award.png",
  "Love":"heart(1).png",
  "Reminders":"cube.png"
};

Widget buildListView(BuildContext context){
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) => GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(7.w),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.circular(10.w)
                ),
                child: Image.asset("assets/icons/${imagesInfo.values.elementAt(index)}")
              ,
              ),
              SizedBox(width: 20.w,),
              Container(
                child: Text(
                  imagesInfo.keys.elementAt(index),
                  style: TextStyle(
                    color:AppColors.primaryText,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],),
        ),
      ))
    ],
  );
}