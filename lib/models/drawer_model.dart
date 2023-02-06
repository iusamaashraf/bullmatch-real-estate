import 'package:bullmatch/constants/icons.dart';
import 'package:flutter/material.dart';

class DrawerModel {
  String? title;
  String? image;
  String? number;
  String? lastUpdate;
  Color? color;
  DrawerModel({
    required this.image,
    required this.lastUpdate,
    required this.number,
    required this.title,
    required this.color,
  });
}

List<DrawerModel> drawerList = [
  DrawerModel(
    image: IconClass.properties,
    lastUpdate: '13.05.22',
    number: '12',
    title: 'PROPERTIES',
    color: const Color(0xff002FED),
  ),
  DrawerModel(
    image: IconClass.peoples,
    lastUpdate: '13.05.22',
    number: '4',
    title: 'Clients',
    color: const Color(0xff5786E9),
  ),
  DrawerModel(
    image: IconClass.matches,
    lastUpdate: '13.05.22',
    number: '7',
    title: 'MATCHES',
    color: const Color(0xff99FFF7),
  ),
  DrawerModel(
    image: IconClass.activity,
    lastUpdate: '13.05.22',
    number: '6',
    title: 'ACTIVITY',
    color: const Color(0xff052051),
  ),
];
