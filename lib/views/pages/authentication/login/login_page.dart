import 'package:bullmatch/constants/colors.dart';
import 'package:bullmatch/constants/icons.dart';
import 'package:bullmatch/views/pages/authentication/register/register_page.dart';
import 'package:bullmatch/views/pages/root/root_page.dart';
import 'package:bullmatch/views/widgets/common_button.dart';
import 'package:bullmatch/views/widgets/common_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/greeting_lines.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorClass.scaffoldColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconClass.logo),
                SizedBox(height: Get.height * 0.06),
                const GreetingLines(
                  firstLine: 'Welcome to ',
                  secondLine: 'BullMatch!',
                ),
                const SizedBox(height: 10),
                Text(
                  'Sign in to continue',
                  style: GoogleFonts.poppins(
                      color: ColorClass.greyColor, fontSize: 11),
                ),
                const SizedBox(height: 20),
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
                  hintText: 'Password',
                  onChanged: (val) {},
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot your Password?',
                        style: GoogleFonts.poppins(
                            fontSize: 11, color: Colors.black),
                      )),
                ),
                const SizedBox(height: 10),
                CommonButton(
                  onTap: () {
                    Get.to(() => RootPage());
                  },
                  text: 'Sign In',
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => RegisterPage());
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Don’t have an account ',
                              style: GoogleFonts.poppins(
                                  color: ColorClass.greyColor, fontSize: 11)),
                          TextSpan(
                            text: 'Register here',
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
      ),
    );
  }
}
