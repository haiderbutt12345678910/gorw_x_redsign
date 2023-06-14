import 'package:flutter/material.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/AuthCubits/reserpassword_cubit.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/StateMangement/BlocStates/bloc_states.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Core/colors.dart';
import 'package:flutter_application_growx_new_design/Features/Presentation/Ui/Widgets/Shared/custom_progressindicatore_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:intl/intl.dart';
import 'package:unicons/unicons.dart';

class Meeting extends StatefulWidget {
  const Meeting({super.key});

  @override
  State<Meeting> createState() => _MeetingState();
}

class _MeetingState extends State<Meeting> {
  DateTime selected = DateTime.now();
  List<NeatCleanCalendarEvent> eventList = [];
  List<NeatCleanCalendarEvent> filtered = [];
  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    for (int i = 0; i < 5; i++) {
      eventList.add(NeatCleanCalendarEvent('Interview Preperation',
          description: 'Online/Remote',
          startTime: DateTime.now().add(const Duration(days: 1)),
          endTime: DateTime.now().add(const Duration(days: 2)),
          color: blue.withOpacity(0.8)));
    }
    setState(() {
      filtered = eventList
          .where((element) =>
              DateFormat('dd-MM-yyyy').format(element.startTime) ==
              DateFormat('dd-MM-yyyy').format(selected))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: blue,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
          onPressed: () {},
        ),
        body: BlocConsumer<ResetPasswordCubit, BlocStates>(
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
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top +
                              MediaQuery.of(context).size.height * 0.035),
                      child: GestureDetector(
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
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top +
                              MediaQuery.of(context).size.height * 0.12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                                    color: blue,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                width: 2.5,
                              ),
                              Container(
                                height: 7.5,
                                width:
                                    MediaQuery.of(context).size.width * 0.075,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              const SizedBox(
                                width: 2.5,
                              ),
                              Container(
                                height: 7.5,
                                width:
                                    MediaQuery.of(context).size.width * 0.0375,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Schedule A Meeting',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.625,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Calendar(
                                    hideTodayIcon: true,
                                    startOnMonday: true,
                                    isExpandable: false,
                                    eventDoneColor: Colors.green,
                                    selectedColor: blue,
                                    selectedTodayColor: blue,
                                    todayColor: blue.withOpacity(0.8),
                                    onDateSelected: (value) {
                                      setState(() {
                                        selected = value;
                                        filtered = eventList
                                            .where((element) =>
                                                DateFormat('dd-MM-yyyy').format(
                                                    element.startTime) ==
                                                DateFormat('dd-MM-yyyy')
                                                    .format(selected))
                                            .toList();
                                      });
                                    },
                                    eventsList: eventList,
                                    eventListBuilder: (context, events) {
                                      return const SizedBox(
                                        height: 0,
                                        width: 0,
                                      );
                                    },
                                    isExpanded: true,
                                    expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                                    datePickerType: DatePickerType.date,
                                    dayOfWeekStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Upcoming',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                    child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: filtered.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 80,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 7.5),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: double.maxFinite,
                                            width: 7.5,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${DateFormat('dd').format(selected)}\n${(DateFormat('MMM').format(selected)).toUpperCase()}',
                                              style: TextStyle(
                                                  color: blue,
                                                  fontSize: 26,
                                                  height: 1.25,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    filtered[index].summary,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: blue,
                                                        fontSize: 16,
                                                        height: 1.25,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 2.5,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${(DateFormat('dd MMM').format(filtered[index].startTime)).toUpperCase()} - ${(DateFormat('dd MMM').format(filtered[index].endTime)).toUpperCase()}\n${filtered[index].description}',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        height: 1.25,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            UniconsLine.angle_right,
                                            color: Colors.white,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (state is Loading) const CustomeCircularProgressIndicator()
                ],
              );
            }),
            listener: (ctx, state) {}));
  }
}
