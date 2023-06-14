import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/reserpassword_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/Shared/custom_progressindicatore_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart' as CM;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final _formKey = GlobalKey<FormState>();
  final textEmailController = TextEditingController();
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );
  List<types.Message> _messages = [];

  void _handleAtachmentPressed() {}

  void _handleMessageTap(BuildContext context, types.Message message) async {}

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage)
        .copyWith(previewData: previewData);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('Asset/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: BlocConsumer<ResetPasswordCubit, BlocStates>(
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
                                MediaQuery.of(context).size.height * 0.015),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
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
                            Image.asset(
                              'Asset/Images/logo-min.png',
                              width: MediaQuery.of(context).size.width * 0.4,
                              fit: BoxFit.fitWidth,
                            ),
                            const SizedBox(
                              height: 25,
                              width: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top +
                                MediaQuery.of(context).size.height * 0.075),
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
                                height: 20,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                height:
                                    MediaQuery.of(context).size.height * 0.58,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CM.Chat(
                                    customBottomWidget: const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                                    theme: CM.DefaultChatTheme(
                                      attachmentButtonIcon: const SizedBox(
                                        height: 0,
                                        width: 0,
                                      ),
                                      primaryColor: blue,
                                      secondaryColor: Colors.black,
                                      sentMessageLinkDescriptionTextStyle:
                                          const TextStyle(color: Colors.white),
                                      sentMessageBodyTextStyle:
                                          const TextStyle(color: Colors.white),
                                      sentMessageCaptionTextStyle:
                                          const TextStyle(color: Colors.white),
                                      sentMessageLinkTitleTextStyle:
                                          const TextStyle(color: Colors.white),
                                      receivedMessageCaptionTextStyle:
                                          const TextStyle(color: Colors.white),
                                      receivedMessageLinkTitleTextStyle:
                                          const TextStyle(color: Colors.white),
                                      receivedMessageLinkDescriptionTextStyle:
                                          const TextStyle(color: Colors.white),
                                      receivedMessageBodyTextStyle:
                                          const TextStyle(color: Colors.white),
                                      backgroundColor: Colors.white,
                                      receivedMessageDocumentIconColor: blue,
                                      sentMessageDocumentIconColor:
                                          Colors.white,
                                      inputTextColor: Colors.white,
                                      inputTextCursorColor: Colors.white,
                                      emptyChatPlaceholderTextStyle:
                                          const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                      inputTextStyle:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    showUserAvatars: true,
                                    messages: _messages,
                                    onAttachmentPressed:
                                        _handleAtachmentPressed,
                                    onMessageTap: _handleMessageTap,
                                    onPreviewDataFetched:
                                        _handlePreviewDataFetched,
                                    onAvatarTap: (user) {},
                                    onSendPressed: (msg) async {},
                                    user: _user,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextFormField(
                                    style: const TextStyle(
                                        fontSize: 17, color: Colors.black),
                                    decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey[700]),
                                        hintText: "Some text...",
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10)),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                          padding:
                                              const MaterialStatePropertyAll(
                                                  EdgeInsets.symmetric(
                                                      vertical: 12.5,
                                                      horizontal: 100)),
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                          backgroundColor:
                                              MaterialStatePropertyAll(blue)),
                                      onPressed: () {},
                                      child: const Text(
                                        'Send',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
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
}
