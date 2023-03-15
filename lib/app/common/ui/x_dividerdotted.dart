import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onigami/app/themes/theme.dart';

class XDividerDotted extends StatelessWidget {
  const XDividerDotted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      padding: const EdgeInsets.all(0),
      borderPadding: const EdgeInsets.all(0),
      strokeWidth: 1,
      strokeCap: StrokeCap.round,
      dashPattern: const [7, 8],
      color: ThemeApp.neutralColor.withOpacity(0.2),
      child: SizedBox(
        height: 1,
        width: Get.width,
      ),
    );
  }
}
