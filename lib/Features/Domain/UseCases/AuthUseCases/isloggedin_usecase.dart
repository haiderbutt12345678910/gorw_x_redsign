import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class IsLoggedInUseCase {
  final Repository repository;

  IsLoggedInUseCase({required this.repository});

  Future<bool> isLoggedIn() async {
    return await repository.isLoggedIn();
  }
}
