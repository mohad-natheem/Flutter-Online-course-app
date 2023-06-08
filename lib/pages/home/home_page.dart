import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/common/entities/entities.dart';
import 'package:online_learning_app/common/routes/names.dart';
import 'package:online_learning_app/common/values/colors.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_states.dart';
import 'package:online_learning_app/pages/home/home_controller.dart';
import 'package:online_learning_app/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem userProfile;


  @override
  void initState(){
    super.initState();
    // _homeController=HomeController(context: context);
    // _homeController.init();
    // userProfile = HomeController(context: context).userProfile;
  
  }
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    userProfile=HomeController(context: context).userProfile;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(userProfile.avatar.toString()),
      body: BlocBuilder<HomePageBlocs,HomePageState>(
        builder:(context,state){
          print(state.courseItem.length);
        if(state.courseItem.isEmpty){
          HomeController(context: context).init();
          print('....course is empty......');
        }else{
          print('......course is not empty.........');
        }
          return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w,vertical: 0),
        child:CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child:homePageText("Hello,",color: AppColors.primaryThreeElementText),
            ),
            SliverToBoxAdapter(
              child:homePageText(userProfile.name??"User",top: 5),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 20.h),),
            SliverToBoxAdapter(
              child: SearchView(),
            ),
            SliverToBoxAdapter(
              child: SlidersView(context,state),
            ),
            SliverToBoxAdapter(
              child: menuView(),
            ),
            SliverPadding(
              padding:EdgeInsets.symmetric(vertical: 18.h,horizontal: 0),
              sliver: SliverGrid(
                delegate:SliverChildBuilderDelegate(
                  childCount: state.courseItem.length,
                  (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushNamed(
                          AppRoutes.COURSE_DETAIL,
                          arguments: {
                            'name':state.courseItem.elementAt(index).id
                          }
                          );

                      },
                      child: courseGrid(state.courseItem[index])
                    );
                  }),
                
                gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.6
                  
                  ) ,
               ))
          ],
        ),
      );
        } ,)
    );
  }
}