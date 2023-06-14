import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Supporting/chat.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Supporting/email.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Supporting/meeting.dart';
import 'package:unicons/unicons.dart';

class Master extends StatefulWidget {
  const Master({super.key});

  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Image.asset(
                        'Asset/Images/drawer.png',
                        width: 30,
                        fit: BoxFit.contain,
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
            const SizedBox(
              height: 35,
            ),
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
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      color: blue, borderRadius: BorderRadius.circular(50)),
                ),
                const SizedBox(
                  width: 2.5,
                ),
                Container(
                  height: 7.5,
                  width: MediaQuery.of(context).size.width * 0.075,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                ),
                const SizedBox(
                  width: 2.5,
                ),
                Container(
                  height: 7.5,
                  width: MediaQuery.of(context).size.width * 0.0375,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Email()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Email',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.85),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      UniconsLine.envelope,
                      size: 40,
                      color: Colors.black.withOpacity(0.85),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Chat()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Live Chat',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.85),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      UniconsLine.comment_dots,
                      size: 40,
                      color: Colors.black.withOpacity(0.85),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Meeting()));
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Video Meeting',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.85),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Icon(
                      UniconsLine.video,
                      size: 40,
                      color: Colors.black.withOpacity(0.85),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
