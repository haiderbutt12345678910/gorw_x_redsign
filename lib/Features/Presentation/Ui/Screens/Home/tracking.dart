import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';
import 'package:intl/intl.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  int selection = 0;
  int selectedDay = 0;
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Grow Master\non demand',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      Image.asset(
                        'Asset/Images/gmd.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'Asset/Images/gtd.png',
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        width: 7.5,
                      ),
                      const Text(
                        'Grow Tech\non demand',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                    width: 25,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Grow Tracking',
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
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = 0;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: selection == 0 ? blue : Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: AutoSizeText(
                            'Plant Care',
                            minFontSize: 10,
                            maxFontSize: 14,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: selection == 0
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.5,
                  ),
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = 1;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: selection == 1 ? blue : Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: AutoSizeText(
                            'Tech Care',
                            minFontSize: 10,
                            maxFontSize: 14,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: selection == 1
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.5,
                  ),
                  Expanded(
                    flex: 4,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selection = 2;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: selection == 2 ? blue : Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: AutoSizeText(
                            'Scheduling for\nPlants & Tech',
                            minFontSize: 10,
                            maxFontSize: 14,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: selection == 2
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.maxFinite,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: AutoSizeText(
                    DateFormat('MMMM yyyy').format(DateTime.now()),
                    minFontSize: 10,
                    maxFontSize: 14,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 85,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = i;
                          });
                        },
                        child: Container(
                          width: 60,
                          margin: const EdgeInsets.symmetric(horizontal: 7.5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          height: 85,
                          decoration: BoxDecoration(
                              color: i == selectedDay ? blue : Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                i < 10
                                    ? '${i + 1}'.padLeft(2, '0')
                                    : '${i + 1}',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: i == selectedDay
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Day',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: i == selectedDay
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.225,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Card(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        'Asset/Images/b_2.jpg',
                        width: double.maxFinite,
                        height: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  right: 110,
                  left: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: const MaterialStatePropertyAll(0),
                              padding: const MaterialStatePropertyAll(
                                  EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.white.withOpacity(0.1))),
                          onPressed: () {},
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'WATCH NOW',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ],
                          )),
                    ),
                  ),
                )
              ],
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
