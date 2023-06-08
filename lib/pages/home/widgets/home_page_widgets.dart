import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/values/constants.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_events.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_states.dart';
import 'package:online_learning_app/pages/home/home_controller.dart';

import '../../../common/entities/course.dart';
import '../../../common/values/colors.dart';
import '../../../common/widgets/base_text_widget.dart';

AppBar buildAppBar(String avatar){
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w,right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 12.h,
            width: 15.w,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image:
                  NetworkImage("${AppConstants.SERVER_API_URL}$avatar"),
                )
              )
              ),
            ),
        ],
      ),
    ),
    
  );
}



Widget homePageText(String text,{Color color=AppColors.primaryText,int top=20}){
  return Container(
              margin: EdgeInsets.only(top: top.h),
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
            );
}

Widget SearchView(){
  return Container(
    child: Row (
      children: [
        Container(
          width: 280.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            color: AppColors.primaryBackground,
            border: Border.all(
              color: AppColors.primaryFourElementText
            )
          ),
          child: Row(
            children:[
              Container(
                margin: EdgeInsets.only(left: 17.w),
              height: 16.h,
              width: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            Container(
              width: 240.w,
              height: 40.h,
              child:   TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
              hintText: "Search your course",
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
            obscureText:false,
          
          ),
            )
            
            ]
          ),
        ),
        Container(
          height: 40.h,
          width: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.circular(13.w)
          ),
          child: Image.asset('assets/icons/options.png'),
        )
      ],
    ),
  );
}
Widget SlidersView(BuildContext context,HomePageState state){
  return Column(
    children: [
     Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 325.w,
      height: 160.h,
      child: PageView(
        onPageChanged: (value) {
          context.read<HomePageBlocs>().add(HomePageDots(value));
        },
        children: [
          sliderViewItem(path:'assets/icons/Art.png'),
          sliderViewItem(path:'assets/icons/Image(1).png'),
          sliderViewItem(path:'assets/icons/Image(2).png'),
          
        ],
      ),
     ),
     Container(
      child: DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
          color: AppColors.primaryThreeElementText,
          activeColor: AppColors.primaryElement,
          size: const Size.square(5.0),
          activeSize: const Size(17.0,5.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          )
        ),
      ),
     )
    ],
  );
}

Widget sliderViewItem({String path='assets/icons/Art.png'}){
  return Container(
            height: 160.h,
            width: 325.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.w),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(path)
              )
            ),
          );

}
Widget menuView(){
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reusableText("Choose your course"),
            reusableText("See All",fontsize: 11,color: AppColors.primaryThreeElementText),
            
            

          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        child: Row(
          children: [
            _reusableMenuText("All"),
            _reusableMenuText("Popular",color: AppColors.primaryThreeElementText),
            _reusableMenuText("Newest",color: AppColors.primaryThreeElementText)
            
          ],
        ),
      )
    ],
  );
}


Widget _reusableMenuText(String text,{Color color=AppColors.primaryElementText}){
  return Container(
margin: EdgeInsets.only(right: 20.w),
padding: EdgeInsets.only(top: 5.h,bottom: 5.h,left: 15.w,right: 15.w),
decoration: BoxDecoration(
  color: color==AppColors.primaryElementText?AppColors.primaryElement:AppColors.primaryBackground,
  borderRadius: BorderRadius.circular(5.w)
),
child: reusableText(
  text,
  color: color,
  fontWeight: FontWeight.normal,
  fontsize: 11),
);

}
Widget courseGrid(CourseItem item){
return  Container(
height: 100,
width: 100,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20.w),
  //image:   DecorationImage(
    //image:NetworkImage(AppConstants.SEVER_UPLOAD_URL+item.thumbnail!),
  
    
    
    // NetworkImage(AppConstants.SEVER_UPLOAD_URL+item.thumbnail!)
    //AssetImage('assets/icons/Image(1).png'),
  //)
),
child:Stack(
  children: [
  Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.w)
    ),
    child:FadeInImage.assetNetwork(
   placeholder: 'assets/icons/Image(1).png',
    image: AppConstants.SEVER_UPLOAD_URL+item.thumbnail!,
  ),),
     Container(
  margin: EdgeInsets.all(12.w),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment:CrossAxisAlignment.start,
    children: [
      Container(
        child:  Text(
          item.name??" ",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            fontSize: 11.sp,
            color: AppColors.primaryElementText,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      SizedBox(height: 5.h,),
      Container(
        child:  Text(
          item.description??" ",
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
            fontSize: 8.sp,
            color: AppColors.primaryFourElementText,
            fontWeight: FontWeight.normal
          ),
        ),
      )
    ],
  ),
),
  ],
)
);
}