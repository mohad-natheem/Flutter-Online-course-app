import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/pages/profile/settings/bloc/settings_page_events.dart';
import 'package:online_learning_app/pages/profile/settings/bloc/settings_page_states.dart';

class SettingsPageBlocs extends Bloc<SettingsPageEvents,SettingsPageStates>{
  SettingsPageBlocs():super(SettingsPageStates()){
    on<TriggerSettings>(_triggerSettings);
  }
  void _triggerSettings(TriggerSettings event,Emitter<SettingsPageStates> emit){
    emit(SettingsPageStates());
  }
}