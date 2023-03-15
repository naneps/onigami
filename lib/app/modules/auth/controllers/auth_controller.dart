import 'package:cloud_firestore/cloud_firestore.dart';
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
  late FirebaseAuth auth;
  late FirebaseFirestore fireStore;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    auth = FirebaseAuth.instance;
    fireStore = FirebaseFirestore.instance;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  Future<void> registerWithPhone() async {
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
      await auth
          .signInWithEmailAndPassword(
            email: email.value,
            password: password.value,
          )
          .then(
            (res) => {
              print("res: ${res.user!.emailVerified}"),
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
  void signOut() async {
    await auth.signOut();
    // navigate to login page
    // listen to auth state
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Get.offAllNamed(Routes.ONBOARDING);
      } else {
        print('User is signed in!');
      }
    });
    // SystemNavigator.pop();
  }

  void createUser() async {
    final user = auth.currentUser;
    await fireStore.collection('users').doc(user!.uid).set(
      {
        'name': name.value,
        'email': email.value,
        'phone': phone.value,
        'createdAt': user.metadata.creationTime,
        'lastSignIn': user.metadata.lastSignInTime,
      },
    );
  }
}
