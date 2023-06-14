import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/resetpassword_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class ResetPasswordCubit extends Cubit<BlocStates> {
  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordCubit({required this.resetPasswordUseCase}) : super(Initial());

  Future<void> resetPasswordEmail(String email) async {
    emit(Loading());
    try {
      await resetPasswordUseCase.resetPasswordEmail(email).then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
