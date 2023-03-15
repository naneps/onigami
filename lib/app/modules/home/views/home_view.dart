import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/common/buttons/XButton.dart';
import 'package:onigami/app/common/buttons/XIconButton.dart';
import 'package:onigami/app/common/shape/rounded_container.dart';
import 'package:onigami/app/common/ui/heading_text.dart';
import 'package:onigami/app/common/ui/xappbar.dart';
import 'package:onigami/app/common/ui/xpicture.dart';
import 'package:onigami/app/common/utils.dart';
import 'package:onigami/app/modules/home/views/best_seller_product_view.dart';
import 'package:onigami/app/themes/theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const XProfileBar(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: Get.width,
                    height: 150,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeApp.backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ThemeApp.darkColor.withOpacity(0.5),
                      ),
                    ),
                    child: Column(
                      children: [],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BestSellerProductView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
