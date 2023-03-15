import 'package:flutter/material.dart';
import 'package:onigami/app/themes/theme.dart';

// ignore: must_be_immutable
class RoundedContainer extends StatelessWidget {
  Widget? child;
  Color? color;
  double? width;
  double? height;
  EdgeInsets? padding;
  EdgeInsets? margin;
  bool? hasBorder;
  bool? hasShadow;
  int? radius;

  RoundedContainer({
    super.key,
    this.child,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.hasBorder = false,
    this.radius = 10,
    this.hasShadow = true,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: padding ?? const EdgeInsets.all(0),
      margin: margin ?? const EdgeInsets.all(0),
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(radius!.toDouble())),
        border: hasBorder!
            ? Border.all(
                color: ThemeApp.darkColor.withOpacity(0.1),
                width: 1,
              )
            : null,
        boxShadow: hasShadow!
            ? [
                BoxShadow(
                  color: ThemeApp.darkColor.withOpacity(0.2),
                  blurRadius: 48,
                  offset: const Offset(0, 40), // changes position of shadow
                ),
              ]
            : null,
      ),
      duration: Duration(milliseconds: 300),
      child: child ?? const SizedBox(),
    );
  }
}
