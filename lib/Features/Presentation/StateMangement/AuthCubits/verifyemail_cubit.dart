import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/verifyemail_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class VerifyEmailCubit extends Cubit<BlocStates> {
  EmailVerfiedUseCase emailVerifiedUseCaset;
  bool? isEmailVerifiedlcal;

  VerifyEmailCubit({required this.emailVerifiedUseCaset}) : super(Initial());

  Future<void> verifyEmail() async {
    emit(Loading());
    try {
      emailVerifiedUseCaset.emailverified().then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
