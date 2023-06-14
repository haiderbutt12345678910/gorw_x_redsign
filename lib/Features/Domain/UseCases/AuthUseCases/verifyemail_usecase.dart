import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class EmailVerfiedUseCase {
  final Repository repository;

  EmailVerfiedUseCase({required this.repository});

  Future<void> emailverified() async {
    return await repository.verifyEmail();
  }
}
