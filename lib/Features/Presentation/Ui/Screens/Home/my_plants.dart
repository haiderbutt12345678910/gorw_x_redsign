import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/readuser_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef InCallback = Function();

class MyPlants extends StatefulWidget {
  final InCallback callback;
  const MyPlants({super.key, required this.callback});

  @override
  State<MyPlants> createState() => _MyPlantsState();
}

class _MyPlantsState extends State<MyPlants> {
  int selectedWeek = 0;
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
              'My Plants',
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
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 85,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      var a = BlocProvider.of<ReadUserCubit>(context)
                          .readUserEntityLocal();
                      int week = int.parse(a!.userplantEntity!.week as String);
                      if (week < i) {
                        var snackBar = const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("Vedio Is Locked"),
                          backgroundColor: Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        setState(() {
                          selectedWeek = i;
                        });
                      }
                    },
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 7.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      height: 85,
                      decoration: BoxDecoration(
                          color: i == selectedWeek ? blue : Colors.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Week',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: i == selectedWeek
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            i < 10 ? '${i + 1}'.padLeft(2, '0') : '${i + 1}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: i == selectedWeek
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 130,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 12,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container(
                        height: 35,
                        width: 80,
                        padding: const EdgeInsets.only(right: 2.5),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.6),
                            borderRadius: BorderRadius.only(
                                topRight: i == 11
                                    ? const Radius.circular(8)
                                    : const Radius.circular(0),
                                bottomRight: i == 11
                                    ? const Radius.circular(8)
                                    : const Radius.circular(0),
                                topLeft: i == 0
                                    ? const Radius.circular(8)
                                    : const Radius.circular(0),
                                bottomLeft: i == 0
                                    ? const Radius.circular(8)
                                    : const Radius.circular(0))),
                        child: Center(
                            child: Text(
                          'Day ${i + 1}',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
              height: 20,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                    backgroundColor: MaterialStatePropertyAll(
                        Colors.grey[700]!.withOpacity(0.5))),
                onPressed: () {
                  widget.callback();
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Proceed Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
