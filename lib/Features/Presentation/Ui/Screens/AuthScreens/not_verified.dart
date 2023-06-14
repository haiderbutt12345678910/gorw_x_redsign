import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/emailverified_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/verifyemail_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/SubsCritionScreens/subscription_overview_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotVerified extends StatefulWidget {
  final String? email;
  const NotVerified({super.key, required this.email});

  @override
  State<NotVerified> createState() => _NotVerifiedState();
}

class _NotVerifiedState extends State<NotVerified> {
  @override
  void initState() {
    BlocProvider.of<VerifyEmailCubit>(context).verifyEmail().then((value) {
      startTimer();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<VerifyEmailCubit, BlocStates>(
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
                      MediaQuery.of(context).size.height * 0.25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Verify Your Email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'We have sent you an email with a verification\nlink at ${widget.email}.\n Please, verify by clicking the link',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
                  heightFactor: 0.4,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
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
        ],
      );
    }), listener: (ctx, state) {
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
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Column(
          children: [
            const Icon(
              Icons.forward_to_inbox,
              size: 60,
              color: Colors.black,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'You will be redirected\nautomatically when verified',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Did not receive an email?',
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
                      onPressed: () {},
                      child: Text(
                        'Resend',
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
    );
  }

  int seconds = 0;
  bool isRunning = false;
  late Timer timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds++;
      BlocProvider.of<EmailVerifiiedCubit>(context).isEmailVerify();
      var a = BlocProvider.of<EmailVerifiiedCubit>(context).isEmailVerifiedlcal;
      if (a == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SubscriptionOverviewScreen()),
        );
        stopTimer();
      } else {}
    });
  }

  void stopTimer() {
    timer.cancel();
    isRunning = false;
  }

  void resetTimer() {
    timer.cancel();
    seconds = 0;
    isRunning = false;
  }
}
