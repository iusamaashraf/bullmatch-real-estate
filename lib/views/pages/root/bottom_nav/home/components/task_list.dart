import 'package:bullmatch/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      width: Get.width,
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(2),
            shrinkWrap: true,
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: taskList[index].color,
                                borderRadius: BorderRadius.circular(4))),
                        const SizedBox(width: 10),
                        Text(
                          taskList[index].task!,
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 11),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => setState(() {
                            taskList[index].isCheck = !taskList[index].isCheck!;
                          }),
                          child: Icon(
                            Icons.done,
                            color: taskList[index].isCheck!
                                ? taskList[index].color
                                : const Color(0xffF3F3F3),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
