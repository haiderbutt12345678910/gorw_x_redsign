import 'package:flutter_application_growx_new_design/Features/Domain/Reppsitory/repository.dart';

class EmailUseCase {
  final Repository repository;

  EmailUseCase({required this.repository});

  Future<void> writeEmails(
    String sender,
    String subject,
    String email,
    String name,
  ) async {
    return await repository.writeEmails(sender, subject, email, name);
  }
}
