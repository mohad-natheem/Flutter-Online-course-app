import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/values/colors.dart';
import 'package:online_learning_app/pages/application/bloc/app_blocs.dart';
import 'package:online_learning_app/pages/application/bloc/app_events.dart';
import 'package:online_learning_app/pages/application/bloc/app_states.dart';
import 'package:online_learning_app/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplcationPageState();
}

class _ApplcationPageState extends State<ApplicationPage> {
  int _index =0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs,AppStates>(
      builder: (context,state){
        return Container(
      color: Colors.white,
      child:  SafeArea(
        child:Scaffold(
          body: Center(
            child: buildPage(state.index),
          ),
          bottomNavigationBar: Container(
            height: 58.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h)

              ),
              boxShadow: [BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
              )]
            ),
            child: BottomNavigationBar(
            elevation: 0,
            onTap: (value) {
              context.read<AppBlocs>().add(TriggerAppEvent(value));
          
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: state.index,
            unselectedItemColor: AppColors.primaryThreeElementText,
            selectedItemColor: AppColors.primaryElement,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: bottomTabs,
            ),
          ),
        ) 
        ),
    );
      });
  }
}