import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class LogInUseCase {
  final Repository repository;

  LogInUseCase({required this.repository});

  Future<void> logIn(String email, String password) async {
    return await repository.logIn(email, password);
  }
}
