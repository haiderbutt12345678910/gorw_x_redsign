import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/logout_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class LogOutCubit extends Cubit<BlocStates> {
  LogOutUseCase logOutUseCase;

  LogOutCubit({required this.logOutUseCase}) : super(Initial());

  Future<void> logout() async {
    emit(Loading());
    try {
      await logOutUseCase.logOut().then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
