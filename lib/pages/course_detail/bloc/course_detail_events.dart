import 'package:online_learning_app/common/entities/course.dart';

abstract class CourseDetailEvents{
  const CourseDetailEvents();
}
class TriggerCourseDetails extends CourseDetailEvents{
  final CourseItem courseItem;
  const TriggerCourseDetails(this.courseItem):super();

}