import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    image: AssetImage('Asset/Images/b_4.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
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
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).size.height * 0.12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'History',
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
                  height: 15,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: 3,
                      separatorBuilder: (context, index) => const Divider(
                        height: 40,
                        color: Colors.black,
                        thickness: 1,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Plant Data',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: blue),
                            ),
                            Text(
                              '20-Dec-2022',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[700]),
                            ),
                            Text(
                              '3:00 PM',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey[600]),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            _buildHeader('Environment'),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildOption('Temperature'),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildOption('Humidity %'),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildOption('CO2 PPM'),
                            const SizedBox(
                              height: 25,
                            ),
                            _buildHeader('Feeding'),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildOption('Water Volume'),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildOption('Water pH'),
                            const SizedBox(
                              height: 10,
                            ),
                            _buildOption('Water Temp'),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  _buildHeader(String title) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.bold, color: blue),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 25,
                ),
                Text(
                  'High',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600, color: blue),
                ),
                const SizedBox(
                  width: 22.5,
                ),
                Text(
                  'Low',
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600, color: blue),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ))
      ],
    );
  }

  _buildOption(String title) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: Colors.black),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    decoration: InputDecoration(
                        isCollapsed: true,
                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(7.5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(7.5)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(7.5)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2.5)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    decoration: InputDecoration(
                        isCollapsed: true,
                        hintStyle:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(7.5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(7.5)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                            borderRadius: BorderRadius.circular(7.5)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2.5)),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
