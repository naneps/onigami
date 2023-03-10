import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onigami/app/common/utils.dart';
import 'package:onigami/app/routes/app_pages.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  RxBool isShowPass = false.obs;
  RxBool isShowPassConfirm = false.obs;
  RxBool isLoading = false.obs;
  RxString phone = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString passwordConfirm = ''.obs;
  RxString name = ''.obs;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<void> registerWithPhone() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.verifyPhoneNumber(
      phoneNumber: phone.value,
      verificationCompleted: (phoneAuthCredential) {
        auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (error) {},
      codeSent: (verificationId, forceResendingToken) {
        // Get.toNamed(Routes.OTP, arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  void loginWithEmailAndPassword() async {
    try {
      isLoading.value = true;
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth
          .signInWithEmailAndPassword(
            email: email.value,
            password: password.value,
          )
          .then(
            (res) => {
              if (res.user != null)
                {
                  // set local storage
                  Get.offAllNamed(Routes.HOME),
                },
            },
          );
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        Utils.errorMessage("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Utils.errorMessage("Wrong password provided for that user.");
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  void registerWithEmailPassword() async {
    try {
      isLoading.value = true;
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth
          .createUserWithEmailAndPassword(
            email: email.value,
            password: password.value,
          )
          .then((res) => {
                if (res.user != null)
                  {
                    res.user!.sendEmailVerification(),
                    res.user!.updateDisplayName(name.value),
                    res.additionalUserInfo!.isNewUser,
                    Utils.successMessage("Register success"),
                  }
              });
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        Utils.errorMessage("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        Utils.errorMessage("The account already exists for that email.");
      }
    } catch (e) {
      isLoading.value = false;
      print(e);
    }
  }

  void loginWithGoogle() async {
    // await Get.find<>
  }
}
