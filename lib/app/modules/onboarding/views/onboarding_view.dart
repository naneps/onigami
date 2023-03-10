import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/common/buttons/XButton.dart';
import 'package:onigami/app/common/buttons/XOutline_Button.dart';
import 'package:onigami/app/modules/onboarding/views/onboarding_page.dart';
import 'package:onigami/app/routes/app_pages.dart';
import 'package:onigami/app/themes/theme.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: IntroductionScreen(
        showDoneButton: false,
        showSkipButton: true,
        showNextButton: true,
        rawPages: [
          OnboardingPage(
            title: "Selamat datang di Onigami ",
            description:
                "aplikasi pembelian onigiri yang gamified! Belanja onigiri jadi lebih seru dengan hadiah poin dan diskon yang bisa didapat.",
            image: "assets/images/analytic.png",
          ),
          OnboardingPage(
            title: "Belanja yuk",
            description:
                "Nikmati pengalaman berbelanja onigiri yang lebih seru dengan Onigami! Dapatkan hadiah poin setiap kali membeli onigiri dan tukarkan dengan diskon atau produk gratis",
            image: "assets/images/analytic.png",
          ),
          OnboardingPage(
            title: "Kumpulkan Point",
            description:
                "Beli onigiri dan kumpulkan poin untuk ditukar dengan diskon dan hadiah-hadiah menarik",
            image: "assets/images/analytic.png",
          ),
          Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/analytic.png",
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Silakan pilih untuk login dengan akun yang sudah ada atau daftar akun baru untuk memulai petualangan belanja onigiri yang menyenangkan.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: ThemeApp.darkColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                XButton(
                  text: "Login",
                  onPressed: () {
                    Get.toNamed(Routes.AUTH);
                  },
                  hasIcon: true,
                  icon: MdiIcons.login,
                ),
                const SizedBox(
                  height: 10,
                ),
                XOutlineButton(
                  text: "Daftar",
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  hasIcon: true,
                  icon: MdiIcons.login,
                  iconColor: ThemeApp.neutralColor,
                  borderColor: ThemeApp.neutralColor,
                  textColor: ThemeApp.neutralColor,
                ),
              ],
            ),
          )
        ],
        next: const Icon(
          MdiIcons.arrowRight,
          size: 30,
        ),
        skip: const Icon(
          MdiIcons.skipNext,
          size: 30,
        ),
        onDone: () {
          // On button pressed
        },
        bodyPadding: const EdgeInsets.all(10),
        animationDuration: 500,
        dotsDecorator: DotsDecorator(
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShapes: const [
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
          ],
          size: const Size(15.0, 10.0),
          color: ThemeApp.neutralColor,
          activeSize: const Size(22.0, 10.0),
          activeColor: ThemeApp.primaryColor,
          activeShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25.0),
            ),
          ),
        ),
      ),
    ));
  }
}
