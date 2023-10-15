import 'package:flutter/material.dart';
import 'package:point_tracking_sys_flutter/core/theme/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? onValidate;
  final bool outlineInputBorder;
  final Color? fillColor;
  final Icon? prefixIcon;
  final double? borderRadius;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onValidate,
    this.outlineInputBorder = false,
    this.fillColor,
    this.prefixIcon,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: fillColor,
        filled: fillColor == null ? false : true,
        prefixIcon: prefixIcon,
        focusedBorder: outlineInputBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: cPrimaryColor,
                  width: 1.5,
                ),
              )
            : null,
        enabledBorder: outlineInputBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: cPrimaryColor,
                  width: 1.5,
                ),
              )
            : null,
        border: outlineInputBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: const BorderSide(
                  color: cPrimaryColor,
                  width: 1.5,
                ),
              )
            : null,
        contentPadding: outlineInputBorder
            ? const EdgeInsets.only(top: 10, left: 10)
            : null,
      ),
      validator: onValidate,
    );
  }
}
