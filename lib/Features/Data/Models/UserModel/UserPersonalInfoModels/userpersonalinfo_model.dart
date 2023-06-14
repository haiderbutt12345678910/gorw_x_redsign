import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPersonalnfoEntity/userpersonalinfo_entity.dart';

class UserpersonalinfoModel extends UserpersonalinfoEntity {
  UserpersonalinfoModel({
    String? name,
    String? userName,
    String? phoneNumber,
    String? email,
    String? imgUrl,
  }) : super(
          name: name,
          userName: userName,
          phoneNumber: phoneNumber,
          email: email,
          imgUrl: imgUrl,
        );

  factory UserpersonalinfoModel.fromJson(Map<String, dynamic> map) {
    return UserpersonalinfoModel(
      email: map['email'],
      imgUrl: map['imgUrl'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      userName: map['userName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'imgUrl': imgUrl,
      'name': name,
      'phoneNumber': phoneNumber,
      'userName': userName
    };
  }
}
