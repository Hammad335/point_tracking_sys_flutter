import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 18),
        )),
        fixedSize: MaterialStateProperty.all(
          Size(width ?? 200, height ?? 50),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: Text(
        label,
        style: textStyle,
      ),
    );
  }
}
