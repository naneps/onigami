import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:onigami/app/common/input/increment_decrement.dart';
import 'package:onigami/app/common/shape/rounded_container.dart';
import 'package:onigami/app/common/ui/xpicture.dart';
import 'package:onigami/app/model/product_cart_model.dart';
import 'package:onigami/app/themes/theme.dart';

class TileProductCart extends GetView {
  final ProductCartModel? productCart;
  const TileProductCart({
    super.key,
    this.productCart,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(1),
      enabled: true,
      endActionPane: ActionPane(
        dismissible: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              width: Get.width,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: ThemeApp.dangerColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                "Hapus dari keranjang",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DismissiblePane(
              onDismissed: () {
                print("onDismissed");
              },
            ),
          ],
        ),
        motion: ScrollMotion(),
        children: [],
      ),
      child: RoundedContainer(
        width: Get.width,
        hasBorder: true,
        hasShadow: false,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            XPicture(
              imageUrl: "",
              size: 50,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Produk 1",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Rp. 100.000",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            IncDecWidget(
              initialValue: 1,
              fontSize: 10,
              iconSize: 10,
              minValue: 1,
              maxValue: 50,
              onChange: (val) {
                print(val);
              },
              width: 90,
            )
          ],
        ),
      ),
    );
  }
}
