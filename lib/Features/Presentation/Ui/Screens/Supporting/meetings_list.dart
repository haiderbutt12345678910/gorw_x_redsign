import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Profile/profile_master.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

class MeetingsList extends StatefulWidget {
  const MeetingsList({super.key});

  @override
  State<MeetingsList> createState() => _MeetingsListState();
}

class _MeetingsListState extends State<MeetingsList> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileMaster()));
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
                    onTap: () {},
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 1,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('Asset/Images/b_3.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.black26),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _key.currentState?.openDrawer();
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
                    height: 25,
                  ),
                  const Text(
                    'Upcomings',
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
                            color: blue,
                            borderRadius: BorderRadius.circular(50)),
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
                    height: 25,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.grey[500]?.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(18)),
                            child: Row(
                              children: [
                                const Expanded(
                                    child: Text(
                                  'New Meeting',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.5),
                                )),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  DateFormat('hh:mm a').format(DateTime.now()),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
