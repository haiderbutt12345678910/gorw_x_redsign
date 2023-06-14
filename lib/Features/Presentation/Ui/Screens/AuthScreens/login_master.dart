import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/login_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';

import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Screens/AuthScreens/forgot_password.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Supporting/meetings_list.dart';

import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/Shared/custom_progressindicatore_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

class LoginMaster extends StatefulWidget {
  const LoginMaster({super.key});

  @override
  State<LoginMaster> createState() => _LoginMasterState();
}

class _LoginMasterState extends State<LoginMaster> {
  final textEditingControllerEmail = TextEditingController();
  final textEditingControllerPassword = TextEditingController();

  @override
  void dispose() {
    textEditingControllerEmail.dispose();
    textEditingControllerPassword.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<LogInCubit, BlocStates>(
            builder: (ctx, state) {
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
                              image: AssetImage('Asset/Images/b_1.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: bluleDark.withOpacity(0.6)),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top +
                              MediaQuery.of(context).size.height * 0.025),
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
                              MediaQuery.of(context).size.height * 0.15),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Fill the form to continue.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: FractionallySizedBox(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.6,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: panelBody(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 20),
                          child: const Text(
                            'Powered By GrowX A.I',
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (state is Loading) const CustomeCircularProgressIndicator()
                ],
              );
            },
            listener: (ctx, state) {}));
  }

  panelBody() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          child: Column(
            children: [
              TextFormField(
                controller: textEditingControllerEmail,
                validator: (value) {
                  if (isEmail(value!)) {
                    return null;
                  } else {
                    return 'Enter valid email';
                  }
                },
                style: const TextStyle(fontSize: 17, color: Colors.black),
                decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(fontSize: 17, color: Colors.grey),
                    hintText: "Email",
                    prefixIcon: Container(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          CupertinoIcons.mail,
                          color: blue,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10)),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: textEditingControllerPassword,
                validator: (value) {
                  if (isAlphanumeric(value!) && value.length > 6) {
                    return null;
                  } else {
                    return 'Password must contain\n•Letters and numbers\n•Minimum 6 characters';
                  }
                },
                style: const TextStyle(fontSize: 17, color: Colors.black),
                decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(fontSize: 17, color: Colors.grey),
                    hintText: "Password",
                    prefixIcon: Container(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          CupertinoIcons.lock,
                          color: blue,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10)),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.zero),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 12.5, horizontal: 15)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStatePropertyAll(blue)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MeetingsList()));
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
