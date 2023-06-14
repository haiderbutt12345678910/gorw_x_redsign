import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/UI/Core/colors.dart';

typedef InCallback = Function();

class PlantData extends StatefulWidget {
  final InCallback callback;
  const PlantData({super.key, required this.callback});

  @override
  State<PlantData> createState() => _PlantDataState();
}

class _PlantDataState extends State<PlantData> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: 1,
          child: Container(),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.callback();
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
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top +
                    MediaQuery.of(context).size.height * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Plant Data',
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
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30)),
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
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
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        vertical: 7.5, horizontal: 15)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.5))),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.grey[300])),
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Upload Picture',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  CupertinoIcons.cloud_upload,
                                  color: blue,
                                  size: 22,
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
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
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 30)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50))),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.grey[600])),
                            onPressed: () {},
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Save',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ],
                            )),
                      ],
                    )),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildHeader(String title) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5,
                ),
                Text(
                  'High',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 25,
                ),
                Text(
                  'Low',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
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
          flex: 3,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white),
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
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                    decoration: InputDecoration(
                        isCollapsed: true,
                        hintStyle:
                            const TextStyle(fontSize: 17, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(7.5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(7.5)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
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
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                    decoration: InputDecoration(
                        isCollapsed: true,
                        hintStyle:
                            const TextStyle(fontSize: 17, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(7.5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(7.5)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.white),
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
