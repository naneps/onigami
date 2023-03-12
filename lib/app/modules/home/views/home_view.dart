import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/common/buttons/XButton.dart';
import 'package:onigami/app/common/buttons/XIconButton.dart';
import 'package:onigami/app/common/ui/xpicture.dart';
import 'package:onigami/app/common/utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              width: Get.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                borderRadius: Utils.handleRequestRadius(
                    radius: 20, radiusType: RadiusType.diagonal1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  XPicture(
                    imageUrl: "",
                    size: 50,
                    radiusType: RadiusType.circle,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Selamat Pagi..',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Ahmad',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  XIconButton(
                    icon: MdiIcons.bellOutline,
                    tooltip: 'Notifikasi',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
