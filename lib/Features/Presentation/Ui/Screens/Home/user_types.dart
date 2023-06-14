import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';

typedef InCallback = Function(int i);

class UserTypes extends StatefulWidget {
  final InCallback callback;
  const UserTypes({super.key, required this.callback});

  @override
  State<UserTypes> createState() => _UserTypesState();
}

class _UserTypesState extends State<UserTypes> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          const Spacer(),
          GestureDetector(
            onTap: () {
              widget.callback(currentPage);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: PageView(
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                children: [_growLog(), _growMaster(), _growTrack()],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [0, 1, 2].map((e) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 3.5),
                decoration: BoxDecoration(
                    color: currentPage == e ? blue : Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                height: currentPage == e ? 7.5 : 10,
                width: currentPage == e ? 25 : 10,
              );
            }).toList(),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  _growLog() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'Asset/Images/grow-log.png',
          width: MediaQuery.of(context).size.width * 0.26,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Grow Log',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Elevate your\ngardening process\nwith GrowLog',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600]),
        ),
      ],
    );
  }

  _growMaster() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'Asset/Images/grow-master.png',
          width: MediaQuery.of(context).size.width * 0.26,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Grow Master',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Unlock your plant\'s full potential\nwith GrowMaster\'s personalized\nsupport for premium subscribers.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600]),
        ),
      ],
    );
  }

  _growTrack() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'Asset/Images/grow-track.png',
          width: MediaQuery.of(context).size.width * 0.26,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Grow Tracking',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Elevate plant care with\nGrow Tracking: Monitor,\noptimize, Thrive',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.grey[600]),
        ),
      ],
    );
  }
}
