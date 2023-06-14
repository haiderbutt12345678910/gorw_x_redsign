import 'package:flutter_application_growx_new_design/Features/Data/Models/UserModel/UserPlantModels/dailyplantdata_model.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/dailyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userweeklyplantdata_entity.dart';

class UserweeklyplantModel extends UserweeklyplantEntity {
  UserweeklyplantModel(
      {List<UserDailyplantdataEntity>? userDailyPlantDataEntityList})
      : super(userDailyPlantDataEntityList: userDailyPlantDataEntityList);

  factory UserweeklyplantModel.fromJson(Map<String, dynamic> map) {
    var list = map['userDailyPlantDataEntityList'] as List<dynamic>?;

    List<UserDailyplantdataEntity>? userDailyPlantDataEntityList;
    if (list != null) {
      userDailyPlantDataEntityList =
          list.map((item) => UserdailyplantModel.fromJson(item)).toList();
    }

    return UserweeklyplantModel(
      userDailyPlantDataEntityList: userDailyPlantDataEntityList,
    );
  }

  Map<String, dynamic> toJson() {
    List<dynamic>? userWeeklyList;
    if (userDailyPlantDataEntityList != null) {
      userWeeklyList = userDailyPlantDataEntityList!
          .map((item) => UserdailyplantModel(
                  co2PPM: item.co2PPM,
                  humidity: item.humidity,
                  imgUrl: item.imgUrl,
                  temp: item.temp,
                  waterPh: item.waterPh,
                  waterTemp: item.waterTemp,
                  waterVolumne: item.waterVolumne)
              .toJson())
          .toList();
    }

    return {
      'userDailyPlantDataEntityList': userWeeklyList,
    };
  }
}
