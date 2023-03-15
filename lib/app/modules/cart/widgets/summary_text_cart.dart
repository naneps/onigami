import 'package:flutter/material.dart';
import 'package:onigami/app/themes/theme.dart';

class SummaryTextCart extends StatelessWidget {
  final String? leftText;
  final String? rightText;
  final Color? color;
  const SummaryTextCart({
    super.key,
    this.leftText = "lef text",
    this.rightText = "right text",
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText!,
          style: TextStyle(
            color: color ?? ThemeApp.neutralColor.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          rightText!,
          style: TextStyle(
            color: color ?? ThemeApp.neutralColor.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
