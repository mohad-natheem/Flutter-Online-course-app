import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/pages/application/bloc/app_blocs.dart';
import 'package:online_learning_app/pages/application/bloc/app_events.dart';
import 'package:online_learning_app/common/widgets/base_text_widget.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_events.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_event.dart';

import '../../../../common/routes/names.dart';
import '../../../../common/values/colors.dart';
import '../../../../common/values/constants.dart';
import '../../../../global.dart';

AppBar buildAppBar(){
  return AppBar(
    centerTitle: true,
    title: Container(
      child: reusableText("Settings")
    ),
  );
}
Widget logoutButton(BuildContext context){
return GestureDetector(
onTap: (){
  showDialog(context: context, builder: (BuildContext context) {
    return AlertDialog(
      title:Text("Confirm Logout") ,
      content: Text("Do you wanna logout?"),
      actions: [
        TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text("Cancel")),
        TextButton(
          onPressed:()=>_removeUserData(context),
          child: const Text("Confirm"))
      ],
    );
  });
},
child: Container(
  height: 100.h,
  decoration: const BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.fitHeight,
      image: AssetImage('assets/icons/Logout.png')
    )
  ),
),
);
}
void _removeUserData(BuildContext context){
  context.read<AppBlocs>().add(const TriggerAppEvent(0));
  context.read<HomePageBlocs>().add(const HomePageDots(0));
  Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
  Global.storageService.remove(AppConstants.STORAGE_USER_PROFILE_KEY);
  context.read<SignInBloc>().add(EmailEvent(""));
  context.read<SignInBloc>().add(PasswordEvent(""));
  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);

  }