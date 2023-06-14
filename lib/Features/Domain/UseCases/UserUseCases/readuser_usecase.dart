import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class ReadUserUseCase {
  final Repository repository;

  ReadUserUseCase({required this.repository});

  Future<UserEntity> readUserEntity() async {
    return await repository.readUserEntity();
  }
}
