import 'package:online_learning_app/common/entities/course.dart';

abstract class HomePageEvents{
  const HomePageEvents();
}
class HomePageDots extends HomePageEvents{
  final int index;
  const HomePageDots(this.index);
}
class HomePageCourseItem extends HomePageEvents{
  final List<CourseItem> courseItem;
  const HomePageCourseItem(this.courseItem);
}