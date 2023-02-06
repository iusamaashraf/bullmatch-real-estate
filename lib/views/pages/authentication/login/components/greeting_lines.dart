import 'package:bullmatch/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingLines extends StatelessWidget {
  const GreetingLines({
    Key? key,
    required this.firstLine,
    required this.secondLine,
  }) : super(key: key);
  final String firstLine;
  final String secondLine;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstLine,
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
          ),
          TextSpan(
            text: secondLine,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: ColorClass.lightBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
