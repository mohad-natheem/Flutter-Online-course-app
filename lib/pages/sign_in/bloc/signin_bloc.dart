import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_event.dart';
import 'package:online_learning_app/pages/sign_in/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc():super(const SignInState()){
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);

  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    print("My email is ${event.email}");
    emit(state.copywith(email: event.email));

  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    print("My password is ${event.password}");
    emit(state.copywith(password: event.password));

  }

}