import 'dart:io';

import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class UpdateUserUseCase {
  final Repository repository;

  UpdateUserUseCase({required this.repository});

  Future<void> updateUserEntity(UserEntity userEntity, File? image) async {
    return await repository.updateUserEntity(userEntity, image);
  }
}
