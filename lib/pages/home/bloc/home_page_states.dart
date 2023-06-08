import 'package:online_learning_app/common/entities/course.dart';

class HomePageState{
  final int index;
  final List<CourseItem> courseItem;
  const HomePageState({this.index=0,this.courseItem=const <CourseItem>[]});

  HomePageState copyWith({int? index,List<CourseItem>? courseItem}){
    return HomePageState(
      index: index??this.index,
      courseItem:courseItem??this.courseItem
      );
  }
}