import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentsPage extends StatelessWidget {
  DocumentsPage({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.8,
      decoration: BoxDecoration(
          color: const Color(0xffF2F2F2).withOpacity(.6),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x00000029),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [],
      ),
    );
  }
}
