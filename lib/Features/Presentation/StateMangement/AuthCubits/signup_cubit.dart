import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/signup_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class SignUpCubit extends Cubit<BlocStates> {
  SignUpUseCase signUpUseCase;

  SignUpCubit({required this.signUpUseCase}) : super(Initial());

  Future<void> signUp(String email, String password) async {
    emit(Loading());
    try {
      await signUpUseCase.signUp(email, password).then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
