import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/modules/home/views/home_view.dart';
import 'package:onigami/app/modules/product/views/products_view.dart';
import 'package:onigami/app/modules/profile/views/profile_view.dart';
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
          activeColor: ThemeApp.neutralColor,
          page: const HomeView(),
        ),
        BottomNav(
          label: "Products",
          icon: MdiIcons.packageVariantClosed,
          activeIcon: MdiIcons.packageVariant,
          activeColor: ThemeApp.neutralColor,
          page: ProductsView(),
        ),
        BottomNav(
            label: "Event",
            icon: MdiIcons.calendarOutline,
            activeIcon: MdiIcons.calendar,
            activeColor: ThemeApp.neutralColor,
            page: Scaffold()),
        BottomNav(
            label: "Profile",
            icon: MdiIcons.accountOutline,
            activeIcon: MdiIcons.account,
            activeColor: ThemeApp.neutralColor,
            page: ProfileView()),
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

  PresenceState validatePresenceState(String timePresence) {
    DateTime timePresenceParse = DateTime.parse(
      timePresence,
    );

    DateTime termsOfTime = DateTime(
      timePresenceParse.year,
      timePresenceParse.month,
      timePresenceParse.day,
      10,
      0,
      0,
    );
    Duration difference = termsOfTime.difference(timePresenceParse);
    if (difference.inMinutes > 15) {
      return PresenceState.overdue;
    } else if (difference.inMinutes < 10) {
      return PresenceState.onTime;
    } else {
      return PresenceState.tolerance;
    }
  }
}

enum PresenceState {
  overdue,
  onTime,
  tolerance,
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
