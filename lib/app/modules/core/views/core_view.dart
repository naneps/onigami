import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onigami/app/themes/theme.dart';

import '../controllers/core_controller.dart';

class CoreView extends GetView<CoreController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
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
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // color: ThemeApp.accentColor,
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    isActive ? nav.activeIcon : nav.icon,
                    color: isActive ? nav.activeColor : ThemeApp.neutralColor,
                  ),
                  SizedBox(
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
