import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/values/colors.dart';
import 'package:online_learning_app/common/widgets/base_text_widget.dart';
import 'package:online_learning_app/pages/course_detail/widgets/course_detail_widgets.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({super.key});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {  
  late var id;
  @override
  void initStates(){
    super.initState();
  
    
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    id = ModalRoute.of(context)!.settings.arguments as Map;
    print(id.values.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body:SingleChildScrollView(
           child: Padding(
              padding:EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thumbNail(),
                  SizedBox(height: 20.h,),
                  menuView(),
                  SizedBox(height: 20.h,),
                  reusableText("Course Description"),
                  SizedBox(height: 15.h,),
                  reusableText("This course gives you the basic idea about app development using flutter where you develop the fronten in flutter and you also develop the backend using the laravel framework using php This course gives you the basic idea about app development using flutter where you develop the fronten in flutter and you also develop the backend using the laravel framework using php",
                  color: AppColors.primaryThreeElementText,
                  fontWeight: FontWeight.normal,
                  fontsize:11 
                  ),
                  SizedBox(height: 20.h,),
                  goBuyButton("Go Buy"),
                  SizedBox(height: 15.h,),
                  reusableText("The Course Includes",fontsize: 14),
                  SizedBox(height:15.h),
                  coursePageListView(),
                  SizedBox(height: 20.h,),
                  reusableText("Lesson List")



                ],
              ),
              )
      )
    ); 

  }
}