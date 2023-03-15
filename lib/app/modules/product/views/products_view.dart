import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/common/input/search_field.dart';
import 'package:onigami/app/common/shape/rounded_container.dart';
import 'package:onigami/app/common/transition/xfade_transition.dart';
import 'package:onigami/app/common/transition/xslide_transition.dart';
import 'package:onigami/app/common/ui/filter_product_widget.dart';
import 'package:onigami/app/common/utils.dart';
import 'package:onigami/app/model/product_model.dart';
import 'package:onigami/app/modules/product/widgets/card_product.dart';
import 'package:onigami/app/themes/theme.dart';
import '../controllers/product_controller.dart';

class ProductsView extends GetView<ProductController> {
  const ProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeApp.backgroundColor,
        title: Text(
          'Produk',
          style: TextStyle(
            color: ThemeApp.neutralColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: XFadeTransition(
            duration: const Duration(milliseconds: 500),
            child: Column(
              children: [
                SearchField(
                  hintText: "Cari Produk",
                  onChanged: (value) {
                    controller.search.value = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const FilterProductWidget(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: StreamBuilder(
                    stream: controller.getProductsFromFireBase(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return MasonryGridView.builder(
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: snapshot.data!.size,
                          itemBuilder: (context, index) {
                            return XSlideTransition(
                              duration: Duration(milliseconds: 700),
                              direction: index % 2 == 0
                                  ? SlideDirection.left
                                  : SlideDirection.right,
                              delay: Duration(milliseconds: 100 * index),
                              child: CardProduct(
                                product: snapshot.data?.docs[index].data(),
                              ),
                            );
                          },
                        );
                      } else {
                        return Utils.loadingWidget();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
