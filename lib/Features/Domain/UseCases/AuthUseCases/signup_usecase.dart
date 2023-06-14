import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class SignUpUseCase {
  final Repository repository;

  SignUpUseCase({required this.repository});

  Future<void> signUp(String email, String password) async {
    return await repository.signUp(email, password);
  }
}
