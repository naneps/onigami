import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/modules/home/views/home_view.dart';
import 'package:onigami/app/themes/theme.dart';

class CoreController extends GetxController {
  //TODO: Implement CoreController
  RxList<BottomNav> navigation = <BottomNav>[].obs;
  RxInt activeNav = 0.obs;
  @override
  void onInit() {
    super.onInit();
    navigation.assignAll(
      [
        BottomNav(
          label: "Home",
          icon: MdiIcons.viewDashboardOutline,
          activeIcon: MdiIcons.viewDashboard,
          activeColor: ThemeApp.primaryColor,
          page: const HomeView(),
        ),
        BottomNav(
            label: "Cart",
            icon: MdiIcons.cartOutline,
            activeIcon: MdiIcons.cart,
            activeColor: ThemeApp.primaryColor,
            page: Scaffold()),
        BottomNav(
            label: "Profile",
            icon: MdiIcons.accountOutline,
            activeIcon: MdiIcons.accountOutline,
            activeColor: ThemeApp.primaryColor,
            page: Scaffold()),
        BottomNav(
            label: "Profile",
            icon: MdiIcons.accountOutline,
            activeIcon: MdiIcons.accountOutline,
            activeColor: ThemeApp.primaryColor,
            page: Scaffold()),
      ],
    );
  }

  Widget currentPage() {
    return navigation.elementAt(activeNav.value).page!;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // int get currentNav => navigation.indexOf()
  set activeIndex(index) => activeNav.value = index;
}

class BottomNav {
  String? label;
  IconData? icon;
  IconData? activeIcon;
  Color? activeColor;
  Widget? page;
  BottomNav(
      {this.label, this.icon, this.activeIcon, this.activeColor, this.page});
}
