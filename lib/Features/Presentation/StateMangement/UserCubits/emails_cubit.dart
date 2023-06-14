import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/email_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class EmailsCubit extends Cubit<BlocStates> {
  EmailUseCase emailUseCase;

  EmailsCubit({required this.emailUseCase}) : super(Initial());

  Future<void> writeEmails(
    String sender,
    String subject,
    String email,
    String name,
  ) async {
    emit(Loading());
    try {
      await emailUseCase
          .writeEmails(sender, subject, email, name)
          .then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
