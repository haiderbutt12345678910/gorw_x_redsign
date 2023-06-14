import 'package:flutter_application_growx_new_design/Features/Data/Models/UserModel/UserPersonalInfoModels/userpersonalinfo_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/UserModel/UserPlantModels/userplantdata_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/usersubscription_model.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPersonalnfoEntity/userpersonalinfo_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/usersubscription_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {UsersubscriptionEntity? usersubscriptionEntity,
      UserpersonalinfoEntity? userpersonalinfoEntity,
      UserplantEntity? userplantEntity})
      : super(
            usersubscriptionEntity: usersubscriptionEntity,
            userplantEntity: userplantEntity,
            userpersonalinfoEntity: userpersonalinfoEntity);

  factory UserModel.fromJson(Map<String, dynamic> map) {
    UsersubscriptionEntity usersubscriptionEntity =
        UsersubscriptionModel.fromJson(map['usersubscriptionEntity']);
    UserpersonalinfoEntity userpersonalinfoEntitylocal =
        UserpersonalinfoModel.fromJson(map['userpersonalinfoEntity']);

    UserplantEntity usersplantsEntity =
        UserPlantModel.fromJson(map['userplantEntity']);

    return UserModel(
        usersubscriptionEntity: usersubscriptionEntity,
        userplantEntity: usersplantsEntity,
        userpersonalinfoEntity: userpersonalinfoEntitylocal);
  }

  Map<String, dynamic> toJson() {
    var usersubscriptionModel = UsersubscriptionModel(
            exprityDate: usersubscriptionEntity!.exprityDate,
            planId: usersubscriptionEntity!.planId,
            planName: usersubscriptionEntity!.planName)
        .toJson();

    var userplantModel = UserPlantModel(
      userSinglePlantEntity: userplantEntity!.userSinglePlantEntity,
      week: userplantEntity!.week,
    ).toJson();

    var userPersonalInfoModel = UserpersonalinfoModel(
            email: userpersonalinfoEntity!.email,
            imgUrl: userpersonalinfoEntity!.imgUrl,
            name: userpersonalinfoEntity!.name,
            phoneNumber: userpersonalinfoEntity!.phoneNumber,
            userName: userpersonalinfoEntity!.userName)
        .toJson();

    return {
      'usersubscriptionEntity': usersubscriptionModel,
      'userplantEntity': userplantModel,
      'userpersonalinfoEntity': userPersonalInfoModel
    };
  }
}
