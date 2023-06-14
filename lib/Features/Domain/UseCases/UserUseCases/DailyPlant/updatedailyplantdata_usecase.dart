import 'dart:io';

import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/dailyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class UpdateDailyPlantDataUseCase {
  final Repository repository;

  UpdateDailyPlantDataUseCase({required this.repository});

  Future<void> updateUserWeeklyPlantEntity(
      String plantId,
      String weekId,
      String mapIndex,
      UserDailyplantdataEntity userDailyplantdataEntity,
      File image) async {
    return await repository.updateUserWeeklyPlantEntity(
        plantId, weekId, mapIndex, userDailyplantdataEntity, image);
  }
}
