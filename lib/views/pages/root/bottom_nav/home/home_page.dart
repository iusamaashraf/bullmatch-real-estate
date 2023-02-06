import 'package:bullmatch/constants/colors.dart';
import 'package:bullmatch/models/task_model.dart';
import 'package:bullmatch/views/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'components/task_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  DateTime? selectedDate;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    selectedDate = lastDayOfMonth.add(const Duration(days: 1));
  }

  void onDateTapped(int index) {
    setState(() {
      selectedIndex = index;
      selectedDate = lastDayOfMonth.add(Duration(days: index + 1));
    });
  }

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.8,
            decoration: BoxDecoration(
                color: const Color(0xffF7F7F7).withOpacity(.6),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ]),
            child: Column(
              children: [
                SizedBox(height: Get.height * 0.04),
                Text(
                  'Welcome back Lior!',
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.04),
                // const HorizontalCalendar(),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      lastDayOfMonth.day,
                      (index) {
                        final currentDate =
                            lastDayOfMonth.add(Duration(days: index + 1));
                        final dayName = DateFormat('EEE').format(currentDate);
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 16.0 : 0.0, right: 16.0),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              selectedIndex = index;
                              onDateTapped(index);
                            }),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  width: 52.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == index
                                        ? const Color(0xffE3E3E3)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(44.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        dayName.substring(0, 3),
                                        style: const TextStyle(
                                          fontSize: 11.0,
                                          color: ColorClass.borderGreyColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Container(
                                        height: Get.height * 0.07,
                                        width: Get.width * 0.1,
                                        // padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.transparent,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: selectedIndex == index
                                                      ? Colors.black12
                                                      : Colors.transparent,
                                                  blurRadius:
                                                      selectedIndex == index
                                                          ? 8
                                                          : 0)
                                            ]),
                                        child: Center(
                                          child: Text(
                                            "${index + 1}",
                                            style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: SearchField(controller: searchController),
                ),
                SizedBox(height: Get.height * 0.02),
                Expanded(
                  child: selectedDate != null ? const TaskList() : Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
