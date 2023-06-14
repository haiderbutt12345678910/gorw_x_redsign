import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';
import 'package:unicons/unicons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController name = TextEditingController(text: 'Arnold');
  TextEditingController username = TextEditingController(text: 'arnold');
  TextEditingController phone = TextEditingController(text: '+1212121212');
  TextEditingController email = TextEditingController(text: 'arnold@email.com');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 35,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.325,
                    height: MediaQuery.of(context).size.width * 0.325,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'Asset/Images/b_2.jpg',
                          fit: BoxFit.cover,
                        ))),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    height: MediaQuery.of(context).size.width * 0.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      UniconsLine.capture,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: name,
                style: const TextStyle(color: Colors.white, fontSize: 17),
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 17),
                  labelStyle: TextStyle(color: blue, fontSize: 16),
                  labelText: 'Name',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: username,
                style: const TextStyle(color: Colors.white, fontSize: 17),
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 17),
                  labelStyle: TextStyle(color: blue, fontSize: 16),
                  labelText: 'Username',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: phone,
                style: const TextStyle(color: Colors.white, fontSize: 17),
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 17),
                  labelStyle: TextStyle(color: blue, fontSize: 16),
                  labelText: 'Phone Number',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: email,
                style: const TextStyle(color: Colors.white, fontSize: 17),
                decoration: InputDecoration(
                  isDense: true,
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 17),
                  labelStyle: TextStyle(color: blue, fontSize: 16),
                  labelText: 'Email',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: blue)),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 12.5, horizontal: 15)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                      backgroundColor: MaterialStatePropertyAll(blue)),
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Save',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
