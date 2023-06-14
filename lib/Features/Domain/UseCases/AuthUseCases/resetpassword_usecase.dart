import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class ResetPasswordUseCase {
  final Repository repository;

  ResetPasswordUseCase({required this.repository});

  Future<void> resetPasswordEmail(String email) async {
    return await repository.resetEmail(email);
  }
}
