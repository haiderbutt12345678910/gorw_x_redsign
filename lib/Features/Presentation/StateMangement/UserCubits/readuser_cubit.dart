import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPersonalnfoEntity/userpersonalinfo_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/usersubscription_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/UserUseCases/readuser_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocStates/bloc_states.dart';

class ReadUserCubit extends Cubit<BlocStates> {
  ReadUserUseCase readUserUseCase;
  UserEntity? userEntity = UserEntity(
      userpersonalinfoEntity: UserpersonalinfoEntity(
        email: null,
        imgUrl: null,
        name: null,
        phoneNumber: null,
        userName: null,
      ),
      userplantEntity: UserplantEntity(userSinglePlantEntity: null, week: null),
      usersubscriptionEntity: UsersubscriptionEntity(
        exprityDate: null,
        planId: null,
        planName: null,
      ));

  ReadUserCubit({required this.readUserUseCase}) : super(Initial());

  Future<void> readUserEntity() async {
    emit(Loading());
    try {
      await readUserUseCase.readUserEntity().then((value) {
        userEntity = value;
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }

  UserEntity? readUserEntityLocal() {
    return userEntity;
  }
}
