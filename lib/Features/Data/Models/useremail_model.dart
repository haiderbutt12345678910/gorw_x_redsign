import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/useremail_entity.dart';

class UserEmailModl extends UserEmailEntity {
  UserEmailModl({
    String? userName,
    String? imgUrl,
    String? email,
    String? createdAt,
    String? reply,
    String? status,
    String? emailId,
    String? uid,
  }) : super(
            uid: uid,
            emailId: emailId,
            status: status,
            imgUrl: imgUrl,
            email: email,
            createdAt: createdAt,
            reply: reply,
            userName: userName);
  factory UserEmailModl.fromJson(Map<String, dynamic> map) {
    return UserEmailModl(
        email: map["email"],
        createdAt: map["createdAt"],
        reply: map["reply"],
        userName: map["userName"],
        imgUrl: map["imgUrl"],
        emailId: map['emailId'],
        status: map['status'],
        uid: map['uid']);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "createdAt": createdAt,
      "reply": reply,
      "userName": userName,
      "imgUrl": imgUrl,
      "status": status,
      "emailId": emailId,
      'uid': uid
    };
  }
}
