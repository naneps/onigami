import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onigami/app/common/utils.dart';

// ignore: must_be_immutable
class XPicture extends StatelessWidget {
  String? imageUrl;
  double? size;
  double? sizeWidth;
  double? sizeHeight;
  String? assetImage;
  RadiusType? radiusType;
  XPicture(
      {Key? key,
      required this.imageUrl,
      this.size = 100,
      this.sizeWidth,
      this.sizeHeight,
      this.radiusType = RadiusType.rounded,
      this.assetImage = "assets/images/placeholder.jpg"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        // show detail image
        showDetail();
      },
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        imageBuilder: (context, imageProvider) => Container(
          width: sizeWidth ?? size,
          height: sizeHeight ?? size,
          decoration: BoxDecoration(
            borderRadius:
                Utils.handleRequestRadius(radius: 10, radiusType: radiusType!),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => Container(
          width: sizeWidth ?? size,
          height: sizeHeight ?? size,
          decoration: BoxDecoration(
            borderRadius: Utils.handleRequestRadius(radiusType: radiusType!),
            color: Colors.grey[300],
            image: DecorationImage(
              image: AssetImage(assetImage!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: sizeWidth ?? size,
          height: sizeHeight ?? size,
          decoration: BoxDecoration(
            borderRadius: Utils.handleRequestRadius(radiusType: radiusType!),
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.grey[300]!,
            ),
            image: DecorationImage(
              image: AssetImage(assetImage!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  showDetail() {
    Get.dialog(
      Dialog(
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.5,
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(assetImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(assetImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  // make enum for borderadius
  // make method for condition borderadius from enum by input
}
