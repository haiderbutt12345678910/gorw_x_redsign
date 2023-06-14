import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userweeklyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class ReadWeeklyPlantDataUseCase {
  final Repository repository;

  ReadWeeklyPlantDataUseCase({required this.repository});

  Future<UserweeklyplantEntity> readUserWeeklyPlantEntitybyDay(
      String plantId, String weekId) async {
    return await repository.readUserWeeklyPlantEntitybyDay(plantId, weekId);
  }
}
