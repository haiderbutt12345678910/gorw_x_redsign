import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/usersingleplantdata_entity.dart';

import 'usersingleplantdata_model.dart';

class UserPlantModel extends UserplantEntity {
  UserPlantModel(
      {String? week, List<UserSinglePlantEntity>? userSinglePlantEntity})
      : super(week: week, userSinglePlantEntity: userSinglePlantEntity);

  factory UserPlantModel.fromJson(Map<String, dynamic> map) {
    var list = map['userSinglePlantEntity'] as List<dynamic>?;

    List<UserSinglePlantEntity>? userSinglePlantEntity;
    if (list != null) {
      userSinglePlantEntity =
          list.map((item) => UserSinglePlantModel.fromJson(item)).toList();
    }

    return UserPlantModel(
        userSinglePlantEntity: userSinglePlantEntity, week: map['week']);
  }

  Map<String, dynamic> toJson() {
    List<dynamic>? userSinglePlantEntityList;
    if (userSinglePlantEntity != null) {
      userSinglePlantEntityList = userSinglePlantEntity!
          .map((item) => UserSinglePlantModel(
                  imgUrl: item.imgUrl,
                  nutrientsList: item.nutrientsList,
                  plantCat: item.plantCat,
                  plantId: item.plantId,
                  plantName: item.plantName,
                  plantationDate: item.plantationDate,
                  status: item.status)
              .toJson())
          .toList();
    }

    return {'week': week, 'userSinglePlantEntity': userSinglePlantEntityList};
  }
}
