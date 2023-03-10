import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onigami/app/themes/theme.dart';

class OnboardingPage extends StatelessWidget {
  String? title;
  String? description;
  String? image;
  OnboardingPage({
    super.key,
    this.title,
    this.description,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image!,
            fit: BoxFit.contain,
          ),
          Text(
            title!,
            style: TextStyle(
              color: ThemeApp.darkColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: Get.width * 0.9,
            child: Text(
              description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ThemeApp.neutralColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
