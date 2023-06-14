import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/AuthUseCases/emailverified_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class EmailVerifiiedCubit extends Cubit<BlocStates> {
  IsEmailVerifiedUseCase isEmailVerifiedUseCase;
  bool? isEmailVerifiedlcal;

  EmailVerifiiedCubit({required this.isEmailVerifiedUseCase})
      : super(Initial());

  Future<void> isEmailVerify() async {
    emit(Loading());
    try {
      isEmailVerifiedUseCase.isEmailVerify().then((value) {
        isEmailVerifiedlcal = value;
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
