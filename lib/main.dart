import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onigami/app/themes/theme.dart';
import 'package:onigami/firebase_options.dart';
import 'package:sp_util/sp_util.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(
    () => SpUtil.getInstance(),
  );

// make function for check user is login or not
// if user is login then go to home page
// if user is not login then go to login page

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      onInit: () {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            print('User is currently signed out!');
            Get.offAllNamed(Routes.AUTH);
          } else {
            print('User is signed in!');
            Get.offAllNamed(Routes.CORE);
          } // else
        });
      },
      initialRoute: Routes.ONBOARDING,
      getPages: AppPages.routes,
      home: Container(),
      theme: ThemeApp.defaultTheme,
    ),
  );
}
