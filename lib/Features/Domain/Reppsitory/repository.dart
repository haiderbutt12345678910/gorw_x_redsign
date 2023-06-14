import 'dart:io';

import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/dailyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userweeklyplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/agent_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/chatoverview_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/livechat_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/useremail_entity.dart';

abstract class Repository {
  //Auth Functions
  Future<void> logOut();
  Future<void> signUp(String email, String password);
  Future<void> logIn(String email, String password);
  Future<bool> isLoggedIn();
  Future<bool> isEmailVerified();
  Future<void> verifyEmail();
  Future<void> resetEmail(String email);

  //UserDataFun
  Future<UserEntity> readUserEntity();
  Future<void> createUserEntity(UserEntity userEntity);
  Future<void> updateUserEntity(UserEntity userEntity, File? image);
  Future<UserweeklyplantEntity> readUserWeeklyPlantEntitybyDay(
      String plantId, String weekId);
  Future<void> updateUserWeeklyPlantEntity(
      String plantId,
      String weekId,
      String mapIndex,
      UserDailyplantdataEntity userDailyplantdataEntity,
      File? image);

  //agentList
  Future<List<AgentEntity>> readAgentList();

  //chatCrud
  Future<String> writeChatMassege(ChatEntity chatEntity, String agentId);
  Stream<List<ChatEntity>> readChatList(String agentId);

  //chatOverViewEntity
  Future<String> requestLiveChat(
      String agentId, ChatOverViewEntity chatOverViewEntity);

  Future<void> writeEmails(
      String sender, String subject, String email, String name);
}
