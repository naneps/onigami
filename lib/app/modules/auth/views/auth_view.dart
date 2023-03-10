import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onigami/app/common/buttons/XButton.dart';
import 'package:onigami/app/common/input/XField.dart';
import 'package:onigami/app/routes/app_pages.dart';
import 'package:onigami/app/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: Get.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/analytic.png",
                          fit: BoxFit.contain,
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Welcome to ",
                            style: TextStyle(
                              color: ThemeApp.darkColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                            children: [
                              TextSpan(
                                text: "Oni",
                                style: GoogleFonts.poppins(
                                  color: ThemeApp.primaryColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: "Gami",
                                style: GoogleFonts.poppins(
                                  color: ThemeApp.darkColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Login to your account",
                    style: TextStyle(
                      color: ThemeApp.darkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  XTextField(
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    prefixIcon: MdiIcons.emailOutline,
                    onSave: (val) {
                      // controller.phone.value = val!;
                      controller.email.value = val!;
                    },
                    validator: (value) {
                      // make validator email must be valid
                      bool validEmail =
                          RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                      if (value.isEmpty) {
                        return "Email can't be empty";
                      } else if (!validEmail) {
                        return "Email must be valid";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () {
                      return XTextField(
                        labelText: "password",
                        hintText: "pass****123",
                        prefixIcon: MdiIcons.lockOutline,
                        onSave: (val) {
                          controller.password.value = val!;
                        },
                        suffixIcon: controller.isShowPass.value
                            ? MdiIcons.eyeOutline
                            : MdiIcons.eyeOffOutline,
                        obscureText: !controller.isShowPass.value,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password can't be empty";
                          }
                          if (value.length < 8) {
                            return "Minimum 8 character";
                          }
                          return null;
                        },
                        onPressSuffix: () {
                          controller.isShowPass.value =
                              !controller.isShowPass.value;
                        },
                      );
                    },
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: ThemeApp.darkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  XButton(
                    text: "Login",
                    hasIcon: true,
                    icon: MdiIcons.login,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.formKey.currentState!.save();
                        // controller.loginWithGoogle();
                        controller.loginWithEmailAndPassword();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: ThemeApp.darkColor,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Or",
                        style: TextStyle(
                          color: ThemeApp.darkColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Divider(
                          color: ThemeApp.darkColor,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
