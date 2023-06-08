import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/pages/register/bloc/register_states.dart';
import 'package:online_learning_app/pages/register/bloc/regiter_events.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterStates>{
  RegisterBloc():super(const RegisterStates()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);

  }

  void _userNameEvent(UserNameEvent event,Emitter<RegisterStates> emit){
    print("${event.userName}");
    emit(state.copywith(userName: event.userName));
  }
  void _emailEvent(EmailEvent event,Emitter<RegisterStates> emit){
    print("${event.email}");
    emit(state.copywith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event,Emitter<RegisterStates> emit){
    print("${event.password}");
    emit(state.copywith(password: event.password));
  }
  void _rePasswordEvent(RePasswordEvent event,Emitter<RegisterStates> emit){
    print("${event.rePassword}");
    emit(state.copywith(rePassword: event.rePassword));
  }
}