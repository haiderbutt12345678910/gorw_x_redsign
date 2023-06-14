import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPersonalnfoEntity/userpersonalinfo_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/usersubscription_entity.dart';

class UserEntity {
  UsersubscriptionEntity? usersubscriptionEntity;
  UserplantEntity? userplantEntity;
  UserpersonalinfoEntity? userpersonalinfoEntity;

  UserEntity(
      {this.usersubscriptionEntity,
      this.userplantEntity,
      this.userpersonalinfoEntity});
}
