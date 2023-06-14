import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/reserpassword_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/emails_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/Shared/custom_progressindicatore_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Email extends StatefulWidget {
  const Email({super.key});

  @override
  State<Email> createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final _formKey = GlobalKey<FormState>();
  final subject = TextEditingController();
  final body = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: BlocConsumer<EmailsCubit, BlocStates>(
              builder: ((context, state) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('Asset/Images/b_4.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top +
                                MediaQuery.of(context).size.height * 0.035),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(),
                            height: 25,
                            width: 25,
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top +
                                MediaQuery.of(context).size.height * 0.12),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Grow Master',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 2.5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 7.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  Container(
                                    height: 7.5,
                                    width: MediaQuery.of(context).size.width *
                                        0.075,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  Container(
                                    height: 7.5,
                                    width: MediaQuery.of(context).size.width *
                                        0.0375,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      controller: subject,
                                      style: const TextStyle(fontSize: 16),
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 15),
                                          border: InputBorder.none,
                                          hintText: 'Subject',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 16)),
                                    ),
                                    const Divider(
                                      height: 0,
                                      thickness: 0.5,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 7.5,
                                    ),
                                    TextFormField(
                                      controller: body,
                                      style: const TextStyle(fontSize: 16),
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 15),
                                          border: InputBorder.none,
                                          hintText: 'Type message',
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 16)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                vertical: 12.5,
                                                horizontal: 50)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(blue)),
                                    onPressed: () {
                                      submit(context);
                                    },
                                    child: const Text(
                                      'Send',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (state is Loading)
                      const CustomeCircularProgressIndicator()
                  ],
                );
              }),
              listener: (ctx, state) {}),
        ));
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<EmailsCubit>(context)
          .writeEmails("", subject.text, body.text, "UserName");
    } else {
      return;
    }
  }

  // void sendEmail() async {
  //   var headers = {
  //     'accept': 'application/json',
  //     'api-key':
  //         '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',
  //     'content-type': 'application/json'
  //   };
  //   var request =
  //       http.Request('POST', Uri.parse('https://api.brevo.com/v3/smtp/email'));
  //   request.body = json.encode({
  //     "sender": {"name": "User", "email": "user@gmail.com"},
  //     "to": [
  //       {"email": "muhmdmustan5253@gmail.com", "name": "Muhammad"}
  //     ],
  //     "subject": subject.text,
  //     "htmlContent":
  //         "<html><head></head><body><p>${body.text}</p></body></html>"
  //   });
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
}
