import 'package:bullmatch/constants/colors.dart';
import 'package:bullmatch/constants/icons.dart';
import 'package:bullmatch/views/pages/authentication/login/components/greeting_lines.dart';
import 'package:bullmatch/views/widgets/common_button.dart';
import 'package:bullmatch/views/widgets/common_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.scaffoldColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(IconClass.logo),
              const SizedBox(height: 20),
              const GreetingLines(
                firstLine: 'Let\'s start to ',
                secondLine: 'BullMatch!',
              ),
              const SizedBox(height: 10),
              Text(
                'Create a new account',
                style: GoogleFonts.poppins(
                    fontSize: 11, color: ColorClass.greyColor),
              ),
              const SizedBox(height: 20),
              CommonTextFormField(
                isSvgPicture: false,
                controller: nameController,
                prefixIcon: IconClass.user,
                hintText: 'Full Name',
                onChanged: (val) {},
              ),
              const SizedBox(height: 10),
              CommonTextFormField(
                controller: emailController,
                prefixIcon: IconClass.email,
                hintText: 'Your email',
                onChanged: (val) {},
              ),
              const SizedBox(height: 10),
              CommonTextFormField(
                isObscure: true,
                controller: passwordController,
                prefixIcon: IconClass.password,
                hintText: 'Create Password',
                onChanged: (val) {},
              ),
              const SizedBox(height: 10),
              CommonTextFormField(
                isObscure: true,
                controller: reEnterPasswordController,
                prefixIcon: IconClass.password,
                hintText: 'Password again',
                onChanged: (val) {},
              ),
              const SizedBox(height: 20),
              CommonButton(
                text: 'Sign Up',
                onTap: () {},
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Have already an account ',
                            style: GoogleFonts.poppins(
                                color: ColorClass.greyColor, fontSize: 11)),
                        TextSpan(
                          text: 'Sign In',
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
