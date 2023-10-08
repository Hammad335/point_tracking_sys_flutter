import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textStyle,
    this.backgroundColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
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
