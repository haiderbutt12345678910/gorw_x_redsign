import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class IsEmailVerifiedUseCase {
  final Repository repository;

  IsEmailVerifiedUseCase({required this.repository});

  Future<bool> isEmailVerify() {
    return repository.isEmailVerified();
  }
}
