import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/pages/course_detail/bloc/course_detail_events.dart';
import 'package:online_learning_app/pages/course_detail/bloc/course_detail_states.dart';

class CourseDetailBlocs extends Bloc<CourseDetailEvents,CourseDetailStates>{
   CourseDetailBlocs():super( CourseDetailStates()){
    on<TriggerCourseDetails>(_triggerCourseDetails);

  }
  void _triggerCourseDetails(TriggerCourseDetails event,Emitter<CourseDetailStates> emit){
    emit(CourseDetailStates(courseItem: event.courseItem));
  }
}