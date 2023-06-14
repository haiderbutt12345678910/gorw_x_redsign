import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/reserpassword_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/Shared/custom_progressindicatore_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final textEmailController = TextEditingController();
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
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top +
                            MediaQuery.of(context).size.height * 0.12),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forgot your password?',
                            style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                                color: blue),
                          ),
                          const SizedBox(
                            height: 7.5,
                          ),
                          const Text(
                            'If you need help resetting your password\nwe can help by sending you a link to reset it.',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            controller: textEmailController,
                            validator: (value) {
                              if (isEmail(value!)) {
                                return null;
                              } else {
                                return 'Enter valid email';
                              }
                            },
                            style: const TextStyle(
                                fontSize: 17, color: Colors.black),
                            decoration: InputDecoration(
                                hintStyle: const TextStyle(
                                    fontSize: 17, color: Colors.grey),
                                hintText: "Email",
                                prefixIcon: Container(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 16.0, left: 5),
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                            height: 50,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    padding: const MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            vertical: 12.5, horizontal: 50)),
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
                                  'Next',
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
                if (state is Loading) const CustomeCircularProgressIndicator()
              ],
            );
          }), listener: (ctx, state) {
            if (state is Sucessfull) {
              var snackBar = const SnackBar(
                duration: Duration(seconds: 1),
                content: Text("Email Has Been Sent"),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              Navigator.of(context).pop();
            }

            if (state is Failure) {
              var snackBar = const SnackBar(
                duration: Duration(seconds: 2),
                content: Text("Some Error Occured! Try Again"),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }),
        ));
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<ResetPasswordCubit>(context)
          .resetPasswordEmail(textEmailController.text);
    }
  }
}
