import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:onigami/app/common/shape/rounded_container.dart';
import 'package:onigami/app/common/ui/xpicture.dart';
import 'package:onigami/app/modules/home/controllers/home_controller.dart';
import 'package:onigami/app/themes/theme.dart';

import '../../../common/ui/heading_text.dart';

class BestSellerProductView extends GetView<HomeController> {
  const BestSellerProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height * 0.7,
        // color: ThemeApp.accentColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Column(
          children: [
            HeadingText(
              leftText: "Best Seller",
              rightText: "Lihat Semua",
              onPressRightText: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: MasonryGridView.builder(
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: controller.bestSellerProducts.length,
                itemBuilder: (context, index) {
                  return RoundedContainer(
                      width: Get.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 15,
                      ),
                      height: index % 2 == 0 ? 300 : 250,
                      hasShadow: false,
                      hasBorder: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: XPicture(
                              size: 140,
                              assetImage:
                                  controller.bestSellerProducts[index].image,
                              imageUrl:
                                  controller.bestSellerProducts[index].image,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            controller.bestSellerProducts[index].name!,
                            style: TextStyle(
                              color: ThemeApp.darkColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            controller.bestSellerProducts[index].priceFormatted,
                            style: TextStyle(
                              color: ThemeApp.darkColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ));
                },
              ),
            )
            // Expanded(
            //   child: StaggeredGrid.count(
            //     axisDirection: AxisDirection.down,
            //     crossAxisCount: 4,
            //     mainAxisSpacing: 10,
            //     crossAxisSpacing: 10,
            //     children: controller.bestSellerProducts
            //         .map((product) => StaggeredGridTile.extent(
            //               mainAxisExtent: 180,
            //               crossAxisCellCount: 2,
            //               child: RoundedContainer(
            //                 hasBorder: true,
            //                 hasShadow: false,
            //                 padding: const EdgeInsets.all(10),
            //                 child: Column(
            //                   children: [],
            //                 ),
            //               ),
            //             ))
            //         .toList(),
            //   ),
            // ),
          ],
        ));
  }
}
