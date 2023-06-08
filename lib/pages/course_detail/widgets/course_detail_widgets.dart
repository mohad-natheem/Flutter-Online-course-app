import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/values/colors.dart';
import 'package:online_learning_app/common/widgets/base_text_widget.dart';

AppBar buildAppBar(){
  return AppBar(
    title: reusableText("Course Detail"),
    centerTitle: true,
  );
}
Widget thumbNail(){
  return Container(
    width: 325.w,
    height:200.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.w),
      image: DecorationImage(
        fit: BoxFit.fitWidth,
        image: AssetImage("assets/icons/Image(1).png"))
    ),

  );
}
Widget menuView(){
  return Container(
    width: 325.w,
    child: Row(
      children: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h,horizontal: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.w),
              border: Border.all(color: AppColors.primaryElement),
              color: AppColors.primaryElement
            ),
            child: reusableText("Author Page",color: AppColors.primaryElementText,fontWeight: FontWeight.normal,fontsize: 10),
          ),
        ),
        _reusableIconNumber('assets/icons/people.png', 0),
        _reusableIconNumber('assets/icons/star.png', 2)
      ],
    ),

  );
}

Widget _reusableIconNumber(String iconName,int number){
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconName),
          height: 20.h,
          width: 20.w,
          ),
          reusableText(
            number.toString(),
            color: AppColors.primaryThreeElementText,
            fontsize: 11)
      ],
    ),
  );
}
Widget goBuyButton(String name){
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
      color: AppColors.primaryElement,
      borderRadius: BorderRadius.circular(10.w),
      border: Border.all(color: AppColors.primaryElement)
    ),
    child: Center(child: reusableText(name,color: AppColors.primaryElementText,fontWeight: FontWeight.normal)),
    
  );
}
var info =<String,String>{
  'video_detail.png':'26 hours Video',
  'file_detail.png':'Total 10 lessons',
  'download_detail.png':'67 download resources'
};

Widget coursePageListView(){
  return Column(
    children: [
      ...List.generate(info.length, (index) => GestureDetector(
        onTap: () {
          
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 15.h),
          child: Row(
            children: [
              Image(image: AssetImage('assets/icons/${info.keys.elementAt(index)}'),
              height: 30.h,
              width: 30.w,
              ),
              SizedBox(width: 10.w,),
              reusableText(info.values.elementAt(index),fontsize: 12)
            ],
          ),
        ),
      ))
    ],
  );
}