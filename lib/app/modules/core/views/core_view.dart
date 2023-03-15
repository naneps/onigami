import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/routes/app_pages.dart';
import 'package:onigami/app/themes/theme.dart';
import 'package:badges/badges.dart' as badges;
import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        floatingActionButton: badges.Badge(
          badgeContent: Text(
            "2",
            style: TextStyle(color: Colors.white),
          ),
          position: badges.BadgePosition.topEnd(top: -5, end: 0),
          child: FloatingActionButton(
            backgroundColor: ThemeApp.neutralColor,
            onPressed: () {
              Get.toNamed(Routes.CART);
            },
            child: const Icon(
              MdiIcons.cartOutline,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: controller.currentPage(),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: controller.navigation.length,
          gapLocation: GapLocation.center,
          gapWidth: 0,
          height: 70,
          tabBuilder: (index, isActive) {
            final nav = controller.navigation[index];
            return Container(
              width: Get.width,
              // padding: EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  // color: ThemeApp.accentColor,
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    isActive ? nav.activeIcon : nav.icon,
                    color: isActive
                        ? nav.activeColor
                        : ThemeApp.neutralColor.withOpacity(0.5),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Visibility(
                    visible: isActive,
                    child: Text(
                      nav.label!,
                      style: TextStyle(
                        fontSize: 12,
                        color:
                            isActive ? nav.activeColor : ThemeApp.neutralColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          activeIndex: controller.activeNav.value,
          onTap: (tab) {
            controller.activeIndex = tab;
          },
          hideAnimationCurve: Curves.easeOutBack,
        ),
      );
    });
  }
}
