import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/common/buttons/XButton.dart';
import 'package:onigami/app/common/ui/x_appbar.dart';
import 'package:onigami/app/modules/cart/widgets/summary_text_cart.dart';
import 'package:onigami/app/modules/cart/widgets/tile_product_cart.dart';
import 'package:onigami/app/themes/theme.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            XAppBar(
              title: "Keranjang",
              hasRightIcon: true,
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const TileProductCart();
                },
              ),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(20),
                  right: Radius.circular(20),
                ),
                // border: Border.all(
                //   color: ThemeApp.neutralColor.withOpacity(0.2),
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summary Cart",
                    style: TextStyle(
                      color: ThemeApp.darkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DottedBorder(
                    child: SizedBox(
                      width: Get.width,
                    ),
                    dashPattern: const [5, 5],
                    color: ThemeApp.neutralColor.withOpacity(0.2),
                    strokeCap: StrokeCap.round,
                    padding: const EdgeInsets.all(0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SummaryTextCart(
                    leftText: "Total item",
                    rightText: "2",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SummaryTextCart(
                    leftText: "Total",
                    rightText: "Rp 100.000",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  XButton(
                    hasIcon: true,
                    onPressed: () {},
                    text: "Checkout",
                    icon: MdiIcons.arrowRight,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
