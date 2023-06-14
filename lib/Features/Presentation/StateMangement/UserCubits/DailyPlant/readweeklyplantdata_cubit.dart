import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userweeklyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/UseCases/UserUseCases/DailyPlant/readweeklyplantdata_usecase.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadWeeklyPlantDataCubit extends Cubit<BlocStates> {
  ReadWeeklyPlantDataUseCase readWeeklyPlantDataUseCase;
  UserweeklyplantEntity? userweeklyplantEntity;

  ReadWeeklyPlantDataCubit({required this.readWeeklyPlantDataUseCase})
      : super(Initial());

  Future<void> readUserWeeklyPlantEntitybyDay(
      String plantId, String weekId) async {
    emit(Loading());
    try {
      await readWeeklyPlantDataUseCase
          .readUserWeeklyPlantEntitybyDay(plantId, weekId)
          .then((value) {
        userweeklyplantEntity = value;
        emit(Sucessfull());
      });
    } on Exception catch (_) {
      emit(Failure());
    }
  }

  UserweeklyplantEntity? readUserWeeklyPlnatEnitityLocall() {
    return userweeklyplantEntity;
  }
}
