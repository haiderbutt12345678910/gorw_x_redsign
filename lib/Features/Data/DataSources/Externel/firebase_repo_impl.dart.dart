import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/UserModel/UserPersonalInfoModels/userpersonalinfo_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/UserModel/UserPlantModels/dailyplantdata_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/UserModel/UserPlantModels/userplantdata_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/UserModel/UserPlantModels/userweeklyplantdata_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/UserModel/user_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/agent_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/livechat_model.dart';
import 'package:flutter_application_growx_new_design/Features/Data/Models/usersubscription_model.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPersonalnfoEntity/userpersonalinfo_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/dailyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userweeklyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/usersubscription_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/agent_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/chatoverview_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/livechat_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/useremail_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';
import 'package:http/http.dart' as http;

class FirbaseRepoImpl extends Repository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  FirbaseRepoImpl(
      {required this.firebaseAuth,
      required this.firebaseFirestore,
      required this.firebaseStorage});
  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<bool> isLoggedIn() async {
    if (firebaseAuth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> logIn(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      await value.user!.sendEmailVerification();

      var userModel = UserModel(
              usersubscriptionEntity: UsersubscriptionEntity(
                  planId: "B", planName: "Basic", exprityDate: "n"),
              userplantEntity:
                  UserplantEntity(week: null, userSinglePlantEntity: null),
              userpersonalinfoEntity: UserpersonalinfoEntity(
                  email: null,
                  imgUrl: null,
                  name: null,
                  phoneNumber: null,
                  userName: null))
          .toJson();

      await firebaseFirestore
          .collection("Users")
          .doc(firebaseAuth.currentUser!.uid)
          .set(userModel);
    });
  }

  @override
  Future<void> createUserEntity(UserEntity userEntity) async {}

  @override
  Future<UserEntity> readUserEntity() async {
    return await firebaseFirestore
        .collection("Users")
        .doc(firebaseAuth.currentUser!.uid)
        .get()
        .then((value) {
      for (int i = 0; i < 20; i++) {
        print(i);
        print(value.data());
      }
      if (value.exists) {
        var map = value.data();

        var userModel =
            UserModel.fromJson(value.data() as Map<String, dynamic>);
        for (int i = 50; i < 80; i++) {
          print(i);
          print(userModel.userplantEntity!.week);
        }
        return userModel;
      } else {
        return UserEntity();
      }
    });
  }

  @override
  Future<void> updateUserEntity(UserEntity userEntity, File? image) async {
//if else conditions will go here

    if (userEntity.userplantEntity!.week != null) {
      var userPlanntModel = UserPlantModel(
              userSinglePlantEntity:
                  userEntity.userplantEntity!.userSinglePlantEntity,
              week: userEntity.userplantEntity!.week)
          .toJson();

      await firebaseFirestore
          .collection("Users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({"userplantEntity": userPlanntModel});
    } else if (userEntity.usersubscriptionEntity!.exprityDate != null) {
      var userSubsCriptionModel = UsersubscriptionModel(
              exprityDate: userEntity.usersubscriptionEntity!.exprityDate,
              planId: userEntity.usersubscriptionEntity!.planId,
              planName: userEntity.usersubscriptionEntity!.planName)
          .toJson();

      await firebaseFirestore
          .collection("Users")
          .doc(firebaseAuth.currentUser!.uid)
          .update({"userplantEntity": userSubsCriptionModel});
    } else {
      var ref = firebaseStorage
          .ref()
          .child("profilePics.jpg")
          .child("${firebaseAuth.currentUser!.uid}.jpg");
      await ref.putFile(image as File).then((p0) async {
        await ref.getDownloadURL().then((value) async {
          var userPeronalInfoModel = UserpersonalinfoModel(
                  email: userEntity.userpersonalinfoEntity!.email,
                  imgUrl: value,
                  name: userEntity.userpersonalinfoEntity!.name,
                  phoneNumber: userEntity.userpersonalinfoEntity!.phoneNumber,
                  userName: userEntity.userpersonalinfoEntity!.userName)
              .toJson();
          await firebaseFirestore
              .collection("Users")
              .doc(firebaseAuth.currentUser!.uid)
              .update({"userpersonalinfoEntity": userPeronalInfoModel});
        });
      });
    }
  }

  @override
  Future<bool> isEmailVerified() async {
    await firebaseAuth.currentUser!.reload();
    if (firebaseAuth.currentUser!.emailVerified) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> verifyEmail() async {
    await firebaseAuth.currentUser!.sendEmailVerification();
  }

  @override
  Future<void> resetEmail(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserweeklyplantEntity> readUserWeeklyPlantEntitybyDay(
      String plantId, String weekId) async {
    return await firebaseFirestore
        .collection("MyPlants")
        .doc(plantId)
        .collection("data")
        .doc(weekId)
        .get()
        .then((value) {
      if (value.exists) {
        var map = value.data();

        var userWeeklyPlantModel =
            UserweeklyplantModel.fromJson(map as Map<String, dynamic>);
        return userWeeklyPlantModel;
      } else {
        return UserweeklyplantEntity();
      }
    });
  }

  @override
  Future<void> updateUserWeeklyPlantEntity(
      String plantId,
      String weekId,
      String mapIndex,
      UserDailyplantdataEntity userDailyplantdataEntity,
      File? image) async {
    var ref = firebaseStorage
        .ref()
        .child("plantPics.jpg")
        .child("${firebaseAuth.currentUser!.uid}.jpg");
    await ref.putFile(image as File).then((p0) async {
      await ref.getDownloadURL().then((value) async {
        var userdailyplantModel = UserdailyplantModel(
                co2PPM: userDailyplantdataEntity.co2PPM,
                dayId: userDailyplantdataEntity.dayId,
                humidity: userDailyplantdataEntity.humidity,
                imgUrl: value,
                temp: userDailyplantdataEntity.temp,
                waterPh: userDailyplantdataEntity.waterPh,
                waterTemp: userDailyplantdataEntity.waterTemp,
                waterVolumne: userDailyplantdataEntity.waterVolumne)
            .toJson();

        await firebaseFirestore
            .collection("MyPlants")
            .doc(plantId)
            .collection("data")
            .doc(weekId)
            .update({weekId: userdailyplantModel});
      });
    });
  }

  @override
  Future<List<AgentEntity>> readAgentList() async {
    List<AgentEntity> agnetList = [];

    try {
      await firebaseFirestore.collection("Agents").get().then((value) {
        if (value.docs.isNotEmpty) {
          List<AgentEntity> newlist = [];
          for (var element in value.docs) {
            var a = element.data();
            final agentModel = AgentModel.fromJson(a);
            newlist.add(agentModel);
          }

          agnetList = newlist;
        }
      });

      return agnetList;
    } on Exception catch (_) {
      return agnetList;
    }
  }

  @override
  Stream<List<ChatEntity>> readChatList(String agentId) {
    return firebaseFirestore
        .collection("Agents")
        .doc(agentId)
        .collection("LiveChats")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("UserChat")
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => ChatModel.fromJson(doc.data()))
            .toList());
  }

  @override
  Future<List<UserEmailEntity>> readEmails() {
    // TODO: implement readEmails
    throw UnimplementedError();
  }

  @override
  Future<String> requestLiveChat(
      String agentId, ChatOverViewEntity chatOverViewEntity) {
    // TODO: implement requestLiveChat
    throw UnimplementedError();
  }

  @override
  Future<String> writeChatMassege(ChatEntity chatEntity, String agentId) {
    // TODO: implement writeChatMassege
    throw UnimplementedError();
  }

  @override
  Future<void> writeEmails(
      String sender, String subject, String email, String name) async {
    var headers = {
      'accept': 'application/json',
      'api-key':
          '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',
      'content-type': 'application/json'
    };
    var request =
        http.Request('POST', Uri.parse('https://api.brevo.com/v3/smtp/email'));
    request.body = json.encode({
      "sender": {"name": name, "email": firebaseAuth.currentUser!.email},
      "to": [
        {"email": "muhmdmustan5253@gmail.com", "name": "Muhammad"}
      ],
      "subject": subject,
      "htmlContent": "<html><head></head><body><p>$email</p></body></html>"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
