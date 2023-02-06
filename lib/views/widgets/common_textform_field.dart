import 'package:bullmatch/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CommonTextFormField extends StatelessWidget {
  CommonTextFormField({
    Key? key,
    required this.prefixIcon,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    this.isObscure = false,
    this.isSvgPicture = true,
  }) : super(key: key);
  final String prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  bool isObscure;
  bool isSvgPicture;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.05,
      child: TextFormField(
        obscureText: isObscure ? true : false,
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              GoogleFonts.poppins(color: ColorClass.greyColor, fontSize: 11),
          isDense: true,
          contentPadding: EdgeInsets.zero,
          prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: isSvgPicture
                  ? SvgPicture.asset(prefixIcon)
                  : const Icon(
                      Icons.person,
                      color: ColorClass.greyColor,
                    )),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorClass.borderGreyColor.withOpacity(.27)),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorClass.borderGreyColor.withOpacity(.27)),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorClass.borderGreyColor.withOpacity(.27)),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorClass.borderGreyColor.withOpacity(.27)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
