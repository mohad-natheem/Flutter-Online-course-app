import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/values/colors.dart';

AppBar BuildAppBar(String type){
  return AppBar(
            bottom: PreferredSize(
              child: Container(
                height: 1.0,
                color:AppColors.primarySecondaryBackground,
              ),
              preferredSize: Size.fromHeight(1.0.h)
              ),
            title: Container(
              margin: EdgeInsets.only(right:type=="Sign Up"? 60.w:0),

              child: Center(
                  child: Text(
                  textAlign:TextAlign.center,
                    type,
                    style: TextStyle(
                      color:AppColors.primaryText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal
                    ),
                   ),
              ),
            ),
            );

}
//pass context because we will work with bloc
Widget BuildThirdPartyLogin(BuildContext context){
  return Container(
    margin: EdgeInsets.only(top: 40.w,bottom: 20.w),
    padding: EdgeInsets.only(left: 25.w,right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcon("google"),
        _reusableIcon("apple"),
        _reusableIcon("facebook")
      ]
    )
  );
        
}
Widget _reusableIcon(String icon_name){

  return GestureDetector(
          onTap: (){},
          child: Container(
            height: 40.w,
            width: 40.w,
            child: Image.asset("assets/icons/${icon_name}.png"),
          ),
        );

      
}
Widget ReusableText(String text){
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.primaryThreeElementText,
        fontSize: 14.sp,
        fontWeight: FontWeight.normal 
      ),
    ),
  );
}
Widget BuildTextField(String hintText,String textType,String iconName, void Function(String value)? func){
 return Container(
  margin: EdgeInsets.only(bottom: 20.h),
  height: 50.h,
  width: 325.h,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color:AppColors.primaryFourElementText)
    ),
    child: Row(
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          margin: EdgeInsets.only(left: 16.w),
          child: Image.asset("assets/icons/${iconName}.png"),
        ),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child:  TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:TextStyle(fontSize: 14.sp,color: AppColors.primarySecondaryElementText),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              enabledBorder:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              disabledBorder:const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                ),
              ),
              
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 12.sp
            ),
            autocorrect: false,
            obscureText: textType=="password"?true:false,
          
          ),

        )
      ],
    ),
  
 ); 
}
Widget forgotPassword(){
  return Container(
   width: 260.w,
   height: 44.h,
   child: GestureDetector(
    child: Text(
      "Forgot password?",
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 12.sp,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryText,
        fontWeight: FontWeight.normal
      ),
    ),
   ),
  );
}
Widget BuildLoginAndRegisterButton(String buttonName,String buttontype,void Function()? func){
  return GestureDetector(
    onTap: func,
    child: Container(
      margin: EdgeInsets.only(top:buttontype=="login"?40:30),
      height: 50.h,
      width: 325.w,
      decoration: BoxDecoration(
        color:buttontype=="login"
        ? AppColors.primaryElement
        :AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: buttontype=="login"
          ?Colors.transparent
          :AppColors.primaryFourElementText
  
        ),
        boxShadow: [BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0,1)
        )]
        
      ),
      child: Center(
        child: Text(
          buttonName,
          style:TextStyle(
            color: buttontype=="login"
            ? AppColors.primaryBackground
            :AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal
          ) ,
        ),
      ),
    ),
  );

}