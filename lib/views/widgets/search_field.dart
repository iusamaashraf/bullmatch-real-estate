import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {},
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintStyle: GoogleFonts.poppins(fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        prefixIcon: const Icon(
          Icons.search,
          size: 25,
          color: Color(
            0xffD0D0D0,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.sliders,
            color: Color(
              0xffD0D0D0,
            ),
          ),
        ),
        hintText: 'Search Call ...',
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
