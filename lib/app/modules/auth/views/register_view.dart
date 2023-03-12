import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onigami/app/common/buttons/XButton.dart';
import 'package:onigami/app/common/input/XField.dart';
import 'package:onigami/app/modules/auth/controllers/auth_controller.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // MAKE COPY WRITER FOR REGISTER
                  Container(
                    child: Image.asset(
                      "assets/images/register.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  XTextField(
                    labelText: "Name",
                    prefixIcon: MdiIcons.accountOutline,
                    keyboardType: TextInputType.emailAddress,
                    onSave: (val) {
                      controller.name.value = val!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
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
                  SizedBox(
                    height: 15,
                  ),

                  XTextField(
                    labelText: "Phone",
                    hintText: "08xxxxxxxxxx",
                    prefixIcon: MdiIcons.phoneOutline,
                    keyboardType: TextInputType.phone,
                    onSave: (val) {
                      // controller.phone.value = val!;
                      controller.phone.value = val!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  XTextField(
                    labelText: "Password",
                    prefixIcon: MdiIcons.lockOutline,
                    keyboardType: TextInputType.visiblePassword,
                    onSave: (val) {
                      controller.password.value = val!;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  XTextField(
                    labelText: "Confirm Password",
                    prefixIcon: MdiIcons.lockOutline,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm Password is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  XButton(
                    text: "Register",
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.formKey.currentState!.save();
                        controller.registerWithEmailPassword();
                      }
                    },
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
