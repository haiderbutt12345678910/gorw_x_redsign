import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/signup_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Screens/AuthScreens/login.dart';

import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/AuthScreens/not_verified.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/Shared/custom_progressindicatore_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool check = false;
  final _formKey = GlobalKey<FormState>();
  final textEditingControllerEmail = TextEditingController();
  final textEditingControllerPassword = TextEditingController();
  final textEditingControllerName = TextEditingController();
  @override
  void dispose() {
    textEditingControllerEmail.dispose();
    textEditingControllerPassword.dispose();
    textEditingControllerName.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<SignUpCubit, BlocStates>(builder: (ctx, state) {
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
                decoration: BoxDecoration(color: bluleDark.withOpacity(0.6)),
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
                        'Let\'s Get Started!',
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
                          bottom: MediaQuery.of(context).padding.bottom + 20),
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
        }, listener: (ctx, state) {
          if (state is Sucessfull) {
            var snackBar = const SnackBar(
              duration: Duration(seconds: 1),
              content: Text("Succesfully Signed Up In"),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NotVerified(email: textEditingControllerEmail.text)));
          }

          if (state is Failure) {
            var snackBar = const SnackBar(
              duration: Duration(seconds: 2),
              content: Text("Some Error Occured! Try Again"),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }));
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
                controller: textEditingControllerName,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter name';
                  }
                },
                style: const TextStyle(fontSize: 17, color: Colors.black),
                decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(fontSize: 17, color: Colors.grey),
                    hintText: "Name",
                    prefixIcon: Container(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16.0, left: 5),
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          CupertinoIcons.person,
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
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    check = !check;
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        check
                            ? Icons.check_circle_outlined
                            : Icons.circle_outlined,
                        color: check ? Colors.black : Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 14,
                                color: check ? Colors.black : Colors.grey,
                                fontWeight: FontWeight.normal),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'By Signing up, you agree to the '),
                              TextSpan(
                                  text: 'Terms of Service',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                              TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                    submit(context);
                  },
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      width: 7.5,
                    ),
                    TextButton(
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        child: Text(
                          'Sign In',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: blue,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submit(BuildContext buildContext) {
    if (_formKey.currentState!.validate()) {
      if (check) {
        BlocProvider.of<SignUpCubit>(context).signUp(
            textEditingControllerEmail.text,
            textEditingControllerPassword.text);
      } else {
        var snackBar = const SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Please Agree To Terms And Conditions To Proceed!"),
          backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      return;
    }
  }
}
