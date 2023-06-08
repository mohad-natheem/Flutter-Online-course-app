import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

Widget reusableText(
  String text,{int fontsize=16,
  FontWeight fontWeight=FontWeight.bold, Color color = AppColors.primaryText}){
return Text(text,style: TextStyle(color: color,fontSize: fontsize.sp,fontWeight: fontWeight ),
);
}