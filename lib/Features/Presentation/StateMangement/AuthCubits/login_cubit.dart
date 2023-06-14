import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class LogInCubit extends Cubit<BlocStates> {
  LogInUseCase logInUseCase;

  LogInCubit({required this.logInUseCase}) : super(Initial());

  Future<void> logIn(String email, String password) async {
    emit(Loading());
    try {
      await logInUseCase.logIn(email, password).then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
