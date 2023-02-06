import 'package:bullmatch/constants/colors.dart';
import 'package:flutter/material.dart';

class TaskModel {
  Color? color;
  String? task;
  bool? isCheck;
  TaskModel({
    required this.color,
    required this.task,
    this.isCheck = false,
  });
}

List<TaskModel> taskList = [
  TaskModel(
      color: ColorClass.darkPurpleColor, task: 'Add property of Daniel B.'),
  TaskModel(color: ColorClass.lightPurpleColor, task: 'Call client Mor C.'),
  TaskModel(
      color: ColorClass.whiteColor,
      task: 'Matches for property Mor and Daniel'),
  TaskModel(color: Colors.black, task: 'Activity for area of Holon'),
  TaskModel(color: ColorClass.lightPurpleColor, task: 'Call client Mor C.'),
];
