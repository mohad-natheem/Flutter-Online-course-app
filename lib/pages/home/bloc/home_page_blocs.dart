import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_events.dart';
import 'package:online_learning_app/pages/home/bloc/home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents,HomePageState>{
  HomePageBlocs():super(HomePageState()){
    on<HomePageDots>(_homePageDots);
    on<HomePageCourseItem>(_homePageCOurseItem);
  }

  void _homePageDots(HomePageDots event,Emitter<HomePageState> emit){
    emit(state.copyWith(index: event.index));
  }
  void _homePageCOurseItem(HomePageCourseItem event,Emitter<HomePageState> emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }
}