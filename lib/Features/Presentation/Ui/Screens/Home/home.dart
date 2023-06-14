import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/logout_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/readuser_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Screens/Home/my_plants.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Screens/Home/plant_data.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Screens/Home/user_types.dart';

import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Screens/Supporting/contact_us.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/AuthScreens/login.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Home/master.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Home/questionaire.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Home/tracking.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Profile/profile.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/SubsCritionScreens/subscription_overview_screen.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Supporting/history.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/Shared/custom_progressindicatore_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController? _pageController;
  int _current = 0;
  @override
  void initState() {
    BlocProvider.of<ReadUserCubit>(context).readUserEntity();

    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: blue,
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            'Asset/Images/b_2.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7.5,
                      ),
                      const Text(
                        'Test User',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Username',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      isThreeLine: false,
                      dense: true,
                      horizontalTitleGap: 5,
                      title: const Text(
                        'Account',
                        style: TextStyle(fontSize: 15),
                      ),
                      leading: Icon(
                        UniconsLine.user,
                        color: blue,
                      ),
                      trailing: const Icon(
                        UniconsLine.angle_right,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _pageController?.jumpToPage(1);
                      },
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 0,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    ListTile(
                      isThreeLine: false,
                      dense: true,
                      horizontalTitleGap: 5,
                      title: const Text(
                        'Upgrade Plan',
                        style: TextStyle(fontSize: 15),
                      ),
                      leading: Icon(
                        UniconsLine.arrow_circle_up,
                        color: blue,
                      ),
                      trailing: const Icon(
                        UniconsLine.angle_right,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SubscriptionOverviewScreen()));
                      },
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 0,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    ListTile(
                      isThreeLine: false,
                      dense: true,
                      horizontalTitleGap: 5,
                      title: const Text(
                        'History',
                        style: TextStyle(fontSize: 15),
                      ),
                      leading: Icon(
                        UniconsLine.file_redo_alt,
                        color: blue,
                      ),
                      trailing: const Icon(
                        UniconsLine.angle_right,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const History()));
                      },
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                      height: 0,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                    ListTile(
                      isThreeLine: false,
                      dense: true,
                      horizontalTitleGap: 5,
                      title: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 15),
                      ),
                      leading: Icon(
                        UniconsLine.signout,
                        color: blue,
                      ),
                      trailing: const Icon(
                        UniconsLine.angle_right,
                        color: Colors.black,
                      ),
                      onTap: () {
                        BlocProvider.of<LogOutCubit>(context)
                            .logout()
                            .then((value) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    UniconsLine.facebook,
                    color: Colors.black.withOpacity(0.85),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    UniconsLine.twitter,
                    color: Colors.black.withOpacity(0.85),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    UniconsLine.instagram_alt,
                    color: Colors.black.withOpacity(0.85),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        body: BlocConsumer<ReadUserCubit, BlocStates>(
            builder: (ctx, state) {
              return Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('Asset/Images/b_4.png'),
                            fit: BoxFit.cover)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                              height: MediaQuery.of(context).padding.top + 15),
                        ),
                        Expanded(
                            child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          children: [
                            UserTypes(
                              callback: (i) {
                                if (i == 0) {
                                  var userData =
                                      BlocProvider.of<ReadUserCubit>(context)
                                          .readUserEntityLocal();

                                  if (userData!.userplantEntity!
                                          .userSinglePlantEntity ==
                                      null) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Questionaire(
                                                    // callback: () {
                                                    //   _pageController?.jumpToPage(4);
                                                    // },
                                                    )));
                                  } else {
                                    _pageController?.jumpToPage(2);
                                  }
                                } else if (i == 2) {
                                  var userData =
                                      BlocProvider.of<ReadUserCubit>(context)
                                          .readUserEntityLocal();
                                  if (userData!
                                          .usersubscriptionEntity!.planId ==
                                      null) {}

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Questionaire(
                                              // callback: () {
                                              //   _pageController?.jumpToPage(4);
                                              // },
                                              )));
                                } else {
                                  _pageController?.jumpToPage(5);
                                }
                              },
                            ),
                            const Profile(),
                            MyPlants(
                              callback: () {
                                _pageController?.jumpToPage(3);
                              },
                            ),
                            PlantData(
                              callback: () {
                                _pageController?.jumpToPage(2);
                              },
                            ),
                            const Tracking(),
                            const Master(),
                          ],
                          onPageChanged: (page) {
                            setState(() {
                              _current = page;
                            });
                          },
                        )),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 22.5, horizontal: 22.5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35)),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_pageController?.page != 0) {
                                    _pageController?.jumpToPage(0);
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        UniconsLine.estate,
                                        size: 40,
                                        color: blue,
                                      ),
                                      _current == 0
                                          ? Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            )
                                          : const SizedBox(
                                              height: 0,
                                              width: 0,
                                            )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        padding: const MaterialStatePropertyAll(
                                            EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 12.5)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15))),
                                        backgroundColor:
                                            MaterialStatePropertyAll(blue)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ContactUs()));
                                    },
                                    child: const Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Contact Us',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_pageController?.page != 1) {
                                    _pageController?.jumpToPage(1);
                                  }
                                },
                                child: Container(
                                  decoration: const BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        UniconsLine.user_circle,
                                        size: 40,
                                        color: blue,
                                      ),
                                      _current == 1
                                          ? Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                  color: blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            )
                                          : const SizedBox(
                                              height: 0,
                                              width: 0,
                                            )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  if (state is Loading) const CustomeCircularProgressIndicator()
                ],
              );
            },
            listener: (ctx, state) {}));
  }
}
