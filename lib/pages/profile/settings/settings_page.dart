import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/routes/names.dart';
import 'package:online_learning_app/common/values/constants.dart';
import 'package:online_learning_app/global.dart';
import 'package:online_learning_app/pages/profile/settings/bloc/settings_page_blocs.dart';
import 'package:online_learning_app/pages/profile/settings/bloc/settings_page_states.dart';

import 'widgets/settings_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsPageBlocs,SettingsPageStates>(
          builder:(context,state){
            return Container(
          child: Column(
            children:  [
              logoutButton(context),
              
            ],
          ),
        );
          } ,)
      ),
    );
  }
}