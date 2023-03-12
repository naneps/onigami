import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:onigami/app/common/input/XField.dart';

class CurrencyInput extends StatefulWidget {
  String? label;
  String? initialValue;
  Function(String)? onChanged;
  Function(dynamic)? validator;
  Function(String)? onSaved;
  CurrencyInput({
    super.key,
    this.label,
    this.onChanged,
    this.initialValue,
    this.validator,
    this.onSaved,
  });

  @override
  State<CurrencyInput> createState() => _CurrencyInputState();
}

class _CurrencyInputState extends State<CurrencyInput> {
  final controller = TextEditingController();
  final numberFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.text = numberFormat.format(0);
    if (widget.initialValue != null) {
      setState(() {
        controller.text = numberFormat.format(
          int.parse(widget.initialValue!),
        );
      });
    }
    controller.addListener(() {
      final newVal = numberFormat.format(
        int.parse(
          controller.text.replaceAll(RegExp(r'[^\d]'), ''),
        ),
      );
      controller.value = controller.value.copyWith(text: newVal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return XTextField(
      controller: controller,
      onSave: (value) {
        widget.onSaved!(value!.replaceAll(RegExp(r'[^\d]'), ''));
      },
      // prefixIcon: MdiIcons.cash,
      keyboardType: TextInputType.number,
      labelText: widget.label ?? 'Amount',
      onChanged: (value) {
        widget.onChanged!(value.replaceAll(RegExp(r'[^\d]'), ''));
      },
      validator: widget.validator,
    );
  }
}
