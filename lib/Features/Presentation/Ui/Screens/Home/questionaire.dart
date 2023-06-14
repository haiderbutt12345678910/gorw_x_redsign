// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/userplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/UserPlantEntity/usersingleplantdata_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/user_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Domain/Enitities/UserEntities/usersubscription_entity.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/readuser_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/UserCubits/updateuser_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Screens/Home/home.dart';

import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/Shared/custom_progressindicatore_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class Questionaire extends StatefulWidget {
  const Questionaire({super.key});

  @override
  State<Questionaire> createState() => _QuestionaireState();
}

class _QuestionaireState extends State<Questionaire> {
  final _formKey = GlobalKey<FormState>();
  final textEmailController = TextEditingController();
  final plantTypeEditingController = TextEditingController();
  final stageEditingContorller = TextEditingController();
  final nutrientsEditingController = TextEditingController();
  DateTime? date;

  @override
  void dispose() {
    plantTypeEditingController.dispose();
    stageEditingContorller.dispose();
    nutrientsEditingController.dispose();

    super.dispose();
  }

  String? selectType, selectNut, selectStage;
  List<String> selectedNut = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: BlocConsumer<UpdateUserCubit, BlocStates>(
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
                          image: AssetImage('Asset/Images/b_4.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                    width: 25,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Let Us Know',
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    decoration: BoxDecoration(
                                        color: blue,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  Container(
                                    height: 7.5,
                                    width: MediaQuery.of(context).size.width *
                                        0.075,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  Container(
                                    height: 7.5,
                                    width: MediaQuery.of(context).size.width *
                                        0.0375,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Expanded(
                                  child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(30)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            height: 12.5,
                                            width: 12.5,
                                            decoration: BoxDecoration(
                                                color: blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              'What type of plant is it?',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: TextFormField(
                                            controller:
                                                plantTypeEditingController,
                                            maxLines: 3,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              filled: true,
                                              fillColor: Colors.grey[400]
                                                  ?.withOpacity(0.8),
                                            ),
                                          )),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(12),
                                      //   child: DropdownButtonHideUnderline(
                                      //     child: DropdownButton2(
                                      //       hint: const Text(
                                      //         'Select Type',
                                      //         style: TextStyle(
                                      //           fontSize: 16,
                                      //           color: Colors.white,
                                      //         ),
                                      //       ),
                                      //       items: ['Type 1', 'Type 2']
                                      //           .map((item) =>
                                      //               DropdownMenuItem<String>(
                                      //                 value: item,
                                      //                 child: Text(
                                      //                   item,
                                      //                   style: const TextStyle(
                                      //                       fontSize: 16,
                                      //                       color:
                                      //                           Colors.white),
                                      //                 ),
                                      //               ))
                                      //           .toList(),
                                      //       value: selectType,
                                      //       onChanged: (value) {
                                      //         setState(() {
                                      //           selectType = value as String;
                                      //         });
                                      //       },
                                      //       dropdownStyleData:
                                      //           DropdownStyleData(
                                      //               offset:
                                      //                   const Offset(0, -2.5),
                                      //               decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(12),
                                      //                   color:
                                      //                       Colors.grey[600])),
                                      //       iconStyleData: const IconStyleData(
                                      //           iconEnabledColor: Colors.white),
                                      //       buttonStyleData: ButtonStyleData(
                                      //         padding: const EdgeInsets.only(
                                      //             left: 12.5,
                                      //             right: 5,
                                      //             top: 5,
                                      //             bottom: 5),
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(12),
                                      //             color: Colors.grey[400]
                                      //                 ?.withOpacity(0.8)),
                                      //         height: 50,
                                      //         width: double.maxFinite,
                                      //       ),
                                      //       menuItemStyleData:
                                      //           const MenuItemStyleData(
                                      //         height: 40,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            height: 12.5,
                                            width: 12.5,
                                            decoration: BoxDecoration(
                                                color: blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              'Which stage of growth is your plant currently in? (e.g., seedling, flowering)',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: TextFormField(
                                            controller: stageEditingContorller,
                                            maxLines: 4,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              filled: true,
                                              fillColor: Colors.grey[400]
                                                  ?.withOpacity(0.8),
                                            ),
                                          )),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(12),
                                      //   child: DropdownButtonHideUnderline(
                                      //     child: DropdownButton2(
                                      //       hint: const Text(
                                      //         'Select Stage',
                                      //         style: TextStyle(
                                      //           fontSize: 16,
                                      //           color: Colors.white,
                                      //         ),
                                      //       ),
                                      //       items: ['Stage 1', 'Stage 2']
                                      //           .map((item) =>
                                      //               DropdownMenuItem<String>(
                                      //                 value: item,
                                      //                 child: Text(
                                      //                   item,
                                      //                   style: const TextStyle(
                                      //                       fontSize: 16,
                                      //                       color:
                                      //                           Colors.white),
                                      //                 ),
                                      //               ))
                                      //           .toList(),
                                      //       value: selectStage,
                                      //       onChanged: (value) {
                                      //         setState(() {
                                      //           selectStage = value as String;
                                      //         });
                                      //       },
                                      //       dropdownStyleData:
                                      //           DropdownStyleData(
                                      //               offset:
                                      //                   const Offset(0, -2.5),
                                      //               decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(12),
                                      //                   color:
                                      //                       Colors.grey[600])),
                                      //       iconStyleData: const IconStyleData(
                                      //           iconEnabledColor: Colors.white),
                                      //       buttonStyleData: ButtonStyleData(
                                      //         padding: const EdgeInsets.only(
                                      //             left: 12.5,
                                      //             right: 5,
                                      //             top: 5,
                                      //             bottom: 5),
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(12),
                                      //             color: Colors.grey[400]
                                      //                 ?.withOpacity(0.8)),
                                      //         height: 50,
                                      //         width: double.maxFinite,
                                      //       ),
                                      //       menuItemStyleData:
                                      //           const MenuItemStyleData(
                                      //         height: 40,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            height: 12.5,
                                            width: 12.5,
                                            decoration: BoxDecoration(
                                                color: blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              'What specific nutrients are you using for your plant?',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: TextFormField(
                                            controller:
                                                nutrientsEditingController,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                            cursorColor: Colors.white,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              filled: true,
                                              fillColor: Colors.grey[400]
                                                  ?.withOpacity(0.8),
                                            ),
                                          )),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(12),
                                      //   child: DropdownButtonHideUnderline(
                                      //     child: DropdownButton2(
                                      //       isExpanded: true,
                                      //       hint: const Text(
                                      //         'Select Nutrients',
                                      //         style: TextStyle(
                                      //             fontSize: 16,
                                      //             color: Colors.white),
                                      //       ),
                                      //       items: [
                                      //         'Nutrient 1',
                                      //         'Nutrient 2',
                                      //         'Nutrient 3',
                                      //         'Nutrient 4'
                                      //       ].map((item) {
                                      //         return DropdownMenuItem<String>(
                                      //           value: item,
                                      //           enabled: false,
                                      //           child: StatefulBuilder(
                                      //             builder:
                                      //                 (context, menuSetState) {
                                      //               final isSelected =
                                      //                   selectedNut
                                      //                       .contains(item);
                                      //               return InkWell(
                                      //                 onTap: () {
                                      //                   isSelected
                                      //                       ? selectedNut
                                      //                           .remove(item)
                                      //                       : selectedNut
                                      //                           .add(item);
                                      //                   setState(() {});
                                      //                   menuSetState(() {});
                                      //                 },
                                      //                 child: SizedBox(
                                      //                   height: double.infinity,
                                      //                   child: Row(
                                      //                     children: [
                                      //                       isSelected
                                      //                           ? const Icon(
                                      //                               Icons
                                      //                                   .check_box_outlined,
                                      //                               color: Colors
                                      //                                   .white,
                                      //                             )
                                      //                           : const Icon(
                                      //                               Icons
                                      //                                   .check_box_outline_blank,
                                      //                               color: Colors
                                      //                                   .white,
                                      //                             ),
                                      //                       const SizedBox(
                                      //                           width: 10),
                                      //                       Text(
                                      //                         item,
                                      //                         style: const TextStyle(
                                      //                             fontSize: 16,
                                      //                             color: Colors
                                      //                                 .white),
                                      //                       ),
                                      //                     ],
                                      //                   ),
                                      //                 ),
                                      //               );
                                      //             },
                                      //           ),
                                      //         );
                                      //       }).toList(),
                                      //       value: selectedNut.isEmpty
                                      //           ? null
                                      //           : selectedNut.last,
                                      //       onChanged: (value) {},
                                      //       selectedItemBuilder: (context) {
                                      //         return [
                                      //           'Nutrient 1',
                                      //           'Nutrient 2',
                                      //           'Nutrient 3',
                                      //           'Nutrient 4'
                                      //         ].map(
                                      //           (item) {
                                      //             return Container(
                                      //               alignment:
                                      //                   AlignmentDirectional
                                      //                       .centerStart,
                                      //               child: Text(
                                      //                 selectedNut.join(', '),
                                      //                 style: const TextStyle(
                                      //                   fontSize: 16,
                                      //                   color: Colors.white,
                                      //                   overflow: TextOverflow
                                      //                       .ellipsis,
                                      //                 ),
                                      //                 maxLines: 1,
                                      //               ),
                                      //             );
                                      //           },
                                      //         ).toList();
                                      //       },
                                      //       dropdownStyleData:
                                      //           DropdownStyleData(
                                      //               offset:
                                      //                   const Offset(0, -2.5),
                                      //               decoration: BoxDecoration(
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(12),
                                      //                   color:
                                      //                       Colors.grey[600])),
                                      //       iconStyleData: const IconStyleData(
                                      //           iconEnabledColor: Colors.white),
                                      //       buttonStyleData: ButtonStyleData(
                                      //         padding: const EdgeInsets.only(
                                      //             left: 12.5,
                                      //             right: 5,
                                      //             top: 5,
                                      //             bottom: 5),
                                      //         decoration: BoxDecoration(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(12),
                                      //             color: Colors.grey[400]
                                      //                 ?.withOpacity(0.8)),
                                      //         height: 50,
                                      //         width: double.maxFinite,
                                      //       ),
                                      //       menuItemStyleData:
                                      //           const MenuItemStyleData(
                                      //         height: 40,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            height: 12.5,
                                            width: 12.5,
                                            decoration: BoxDecoration(
                                                color: blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              'On which day did you plant your plant?',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          DateTime? selectedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now()
                                                      .subtract(const Duration(
                                                          days: 365 * 25)),
                                                  lastDate: DateTime.now().add(
                                                      const Duration(
                                                          days: 365 * 25)));
                                          if (selectedDate != null) {
                                            date = selectedDate;
                                          }
                                        },
                                        child: Container(
                                          width: double.maxFinite,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.grey[400]
                                                  ?.withOpacity(0.8)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF002C31),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Text(
                                                    DateFormat('MMM')
                                                        .format(DateTime.now()),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF002C31),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Text(
                                                    DateFormat('dd')
                                                        .format(DateTime.now()),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF002C31),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Text(
                                                    DateFormat('yyyy')
                                                        .format(DateTime.now()),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            height: 12.5,
                                            width: 12.5,
                                            decoration: BoxDecoration(
                                                color: blue,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Expanded(
                                            child: Text(
                                              'Which day of the week are you currently on in your plant\'s growth?',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () async {
                                          DateTime? selectedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now()
                                                      .subtract(const Duration(
                                                          days: 365 * 25)),
                                                  lastDate: DateTime.now().add(
                                                      const Duration(
                                                          days: 365 * 25)));
                                          if (selectedDate != null) {
                                            date = selectedDate;
                                          }
                                        },
                                        child: Container(
                                          width: double.maxFinite,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.grey[400]
                                                  ?.withOpacity(0.8)),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF002C31),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Text(
                                                    DateFormat('MMM')
                                                        .format(DateTime.now()),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF002C31),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Text(
                                                    DateFormat('dd')
                                                        .format(DateTime.now()),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 25,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF002C31),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Text(
                                                    DateFormat('yyyy')
                                                        .format(DateTime.now()),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      ElevatedButton(
                                          style: ButtonStyle(
                                              padding:
                                                  const MaterialStatePropertyAll(
                                                      EdgeInsets.symmetric(
                                                          vertical: 12.5,
                                                          horizontal: 15)),
                                              shape: MaterialStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      blue)),
                                          onPressed: () {
                                            submit(context);
                                          },
                                          child: const Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Sign In',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 17),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 20,
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 20),
                          child: const Text(
                            'Powered By GrowX A.I',
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is Loading) const CustomeCircularProgressIndicator()
              ],
            );
          }), listener: (ctx, state) {
            if (state is Sucessfull) {
              var snackBar = const SnackBar(
                duration: Duration(seconds: 1),
                content: Text("Succesfully Saved!"),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              BlocProvider.of<ReadUserCubit>(context)
                  .readUserEntity()
                  .then((value) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              });
            }

            if (state is Failure) {
              var snackBar = const SnackBar(
                duration: Duration(seconds: 2),
                content: Text("Some Error Occured! Try Again"),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }),
        ));
  }

  void submit(BuildContext buildContext) {
    if (_formKey.currentState!.validate()) {
      date ??= DateTime.now();

      DateTime dateTime = DateTime.parse(date.toString());
      DateTime localDate = dateTime.toLocal();
      String newdate = DateFormat('yyyy-MM-dd').format(localDate);
      DateTime currentDate = DateTime.now();

      // Assuming userDate is provided as a string in "yyyy-MM-dd" format
      String userDateString =
          newdate.toString(); // Replace with the actual user-provided date
      DateTime userDate = DateFormat('yyyy-MM-dd').parse(userDateString);

      int dateDifference = currentDate.difference(userDate).inDays;
      int weekCount = (dateDifference / 7).ceil();

      var a = UserEntity(
          usersubscriptionEntity: UsersubscriptionEntity(exprityDate: null),
          userplantEntity: UserplantEntity(
              week: weekCount.toString(),
              userSinglePlantEntity: [
                UserSinglePlantEntity(
                  imgUrl:
                      "https://tse2.mm.bing.net/th?id=OIP.mVrxZ59HW9OXfiJUovcdtgHaE8&pid=Api&P=0&h=180",
                  nutrientsList: nutrientsEditingController.text,
                  plantCat: plantTypeEditingController.text,
                  plantId: const Uuid().v4(),
                  plantName: plantTypeEditingController.text,
                  status: "A",
                  plantationDate: date.toString(),
                ),
              ]));
      BlocProvider.of<UpdateUserCubit>(context).updateUserEntity(a, null);
    }
  }
}
