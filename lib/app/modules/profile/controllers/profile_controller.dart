import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  RxList<FeatureProfile> features = <FeatureProfile>[
    FeatureProfile(
      name: 'Pengaturan Akun',
      description: 'Edit your profile',
      icon: MdiIcons.accountOutline,
      route: '/profile',
    ),

    FeatureProfile(
      name: 'Riwayat Transaksi',
      description: 'Edit your profile',
      icon: MdiIcons.history,
      route: '/profile',
    ),
    FeatureProfile(
      name: 'Settings',
      description: 'Edit your settings',
      icon: MdiIcons.cogOutline,
      route: '/settings',
    ),
    FeatureProfile(
      name: 'About',
      description: 'About this app',
      icon: MdiIcons.informationOutline,
      route: '/about',
    ),
    // FeatureProfile(
    //   name: 'Logout',
    //   description: 'Logout from this app',
    //   icon: Icons.logout,
    //   route: '/logout',
    // ),
  ].obs;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Stream<User?> get userStream => auth.authStateChanges();

  void setDisplayName(String name) {
    user!.updateDisplayName(name);
  }

  void setPhotoURL(String url) {
    user!.updatePhotoURL(url);
  }

  void setEmail(String email) {
    user!.updateEmail(email);
  }

  void setPassword(String password) {
    user!.updatePassword(password);
  }

// how get user profile realtime from firebase
  // Stream get userStream => auth.userChanges();
}

class FeatureProfile {
  String? name;
  String? description;
  String? assetIcon;
  IconData? icon;
  String? route;
  FeatureProfile({
    this.name,
    this.description,
    this.icon,
    this.route,
    this.assetIcon,
  });
}
