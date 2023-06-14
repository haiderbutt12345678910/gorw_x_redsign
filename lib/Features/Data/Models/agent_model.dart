import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/agent_entity.dart';

class AgentModel extends AgentEntity {
  AgentModel({
    String? id,
    String? name,
  }) : super(id: id, name: name);

  factory AgentModel.fromJson(Map<String, dynamic> map) {
    return AgentModel(
      id: map["id"],
      name: map["name"],
    );
  }
}
