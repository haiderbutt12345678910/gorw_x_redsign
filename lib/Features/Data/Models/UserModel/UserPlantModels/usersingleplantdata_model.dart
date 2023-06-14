import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/usersingleplantdata_entity.dart';

class UserSinglePlantModel extends UserSinglePlantEntity {
  UserSinglePlantModel({
    String? plantName,
    String? plantId,
    String? plantCat,
    String? plantationDate,
    String? nutrientsList,
    String? imgUrl,
    String? status,
  }) : super(
          plantCat: plantCat,
          plantId: plantId,
          plantName: plantName,
          plantationDate: plantationDate,
          imgUrl: imgUrl,
          nutrientsList: nutrientsList,
          status: status,
        );

  factory UserSinglePlantModel.fromJson(Map<String, dynamic> map) {
    return UserSinglePlantModel(
        imgUrl: map['imgUrl'],
        nutrientsList: map['nutrientsList'],
        plantCat: map['plantCat'],
        plantId: map['plantId'],
        plantName: map['plantName'],
        plantationDate: map['plantationDate'],
        status: map['status']);
  }

  Map<String, dynamic> toJson() {
    return {
      'imgUrl': imgUrl,
      'nutrientsList': nutrientsList,
      'plantCat': plantCat,
      'plantId': plantId,
      'plantName': plantName,
      'plantationDate': plantationDate,
      'status': status
    };
  }
}
