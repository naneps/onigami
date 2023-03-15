import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/common/buttons/XIconButton.dart';
import 'package:onigami/app/common/shape/rounded_container.dart';
import 'package:onigami/app/common/ui/xpicture.dart';
import 'package:onigami/app/common/utils.dart';
import 'package:onigami/app/model/product_model.dart';
import 'package:onigami/app/routes/app_pages.dart';
import 'package:onigami/app/themes/theme.dart';

class CardProduct extends StatelessWidget {
  ProductModel? product;
  CardProduct({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          Routes.PRODUCT,
          arguments: product,
        );
      },
      child: RoundedContainer(
        hasBorder: true,
        hasShadow: false,
        width: Get.width,
        height: 200,
        margin: const EdgeInsets.all(5),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: ThemeApp.accentColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: XPicture(
                    imageUrl: product!.image ?? " ",
                    assetImage: product!.image != null
                        ? "assets/products/product1.jpg"
                        : null,
                    sizeWidth: Get.width,
                    sizeHeight: 120,
                    radiusType: RadiusType.none,
                  ),
                ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        product!.name ?? "Produk Name",
                        style: TextStyle(
                          color: ThemeApp.neutralColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        product!.priceFormatted,
                        style: TextStyle(
                          color: ThemeApp.neutralColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: XIconButton(
                icon: MdiIcons.heartOutline,
                color: ThemeApp.neutralColor,
                supportColor: ThemeApp.accentColor,
                size: 25,
                onTap: () async {
                  print('Add to favorite');
                  await FirebaseFirestore.instance.collection('favorites').add(
                    {
                      'product': product!.id ?? " ",
                      'user': 'user',
                    },
                  ).then((value) => print('Added to favorite'));
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                    color: ThemeApp.neutralColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      MdiIcons.cartOutline,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      print('Add to cart');
                      await FirebaseFirestore.instance.collection('carts').add(
                        {
                          'product': product!.id ?? " ",
                          'user': 'user',
                        },
                      ).then((value) => print('Added to cart'));
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
