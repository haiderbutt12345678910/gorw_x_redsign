import 'dart:io';

import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/UserUseCases/updateuser_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class UpdateUserCubit extends Cubit<BlocStates> {
  UpdateUserUseCase updateUserUseCase;

  UpdateUserCubit({required this.updateUserUseCase}) : super(Initial());

  Future<void> updateUserEntity(UserEntity userEntity, File? image) async {
    emit(Loading());
    try {
      await updateUserUseCase.updateUserEntity(userEntity, image).then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
