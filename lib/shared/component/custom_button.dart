import 'package:flutter/material.dart';
import 'package:news_flash/shared/shared.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final Widget child;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? color;

  const CustomButton({
    super.key,
    this.onPressed,
    this.padding,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.primary,
          padding: padding ??
              const EdgeInsets.all(
                16,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 16,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
