import '../../Domain/Enitities/UserEntities/usersubscription_entity.dart';

class UsersubscriptionModel extends UsersubscriptionEntity {
  UsersubscriptionModel({
    String? planId,
    String? exprityDate,
    String? planName,
  }) : super(planId: planId, exprityDate: exprityDate, planName: planName);

  factory UsersubscriptionModel.fromJson(Map<String, dynamic> map) {
    return UsersubscriptionModel(
      planId: map['planId'],
      exprityDate: map['exprityDate'],
      planName: map['planName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'planId': planId,
      'exprityDate': exprityDate,
      'planName': planName,
    };
  }
}
