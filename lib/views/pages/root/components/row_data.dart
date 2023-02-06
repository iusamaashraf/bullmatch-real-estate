import 'package:bullmatch/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowData extends StatelessWidget {
  const RowData({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 11, color: ColorClass.borderGreyColor),
          ),
        ],
      ),
    );
  }
}
