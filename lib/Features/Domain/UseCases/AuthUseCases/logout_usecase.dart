import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class LogOutUseCase {
  final Repository repository;

  LogOutUseCase({required this.repository});

  Future<void> logOut() async {
    return await repository.logOut();
  }
}
