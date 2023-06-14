import 'dart:io';

import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/dailyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/UserUseCases/DailyPlant/updatedailyplantdata_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDailyPlantDataCubit extends Cubit<BlocStates> {
  UpdateDailyPlantDataUseCase updateDailyPlantDataUseCase;

  UpdateDailyPlantDataCubit({required this.updateDailyPlantDataUseCase})
      : super(Initial());

  Future<void> updateUserWeeklyPlantEntity(
      String plantId,
      String weekId,
      String mapIndex,
      UserDailyplantdataEntity userDailyplantdataEntity,
      File image) async {
    emit(Loading());
    try {
      await updateDailyPlantDataUseCase
          .updateUserWeeklyPlantEntity(
              plantId, weekId, mapIndex, userDailyplantdataEntity, image)
          .then((value) {
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }
}
