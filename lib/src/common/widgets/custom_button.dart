import 'package:flutter/material.dart';

import '../package_colors.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.padding,
    required this.child,
    required this.onTap,
    this.height,
    this.width = double.infinity,
    this.boxDecoration,
    this.color,
    this.animatationDuration = const Duration(milliseconds: 500),
  });

  final VoidCallback? onTap;
  final Widget child;
  final BoxDecoration? boxDecoration;
  final double? height;
  final double? width;
  final Duration animatationDuration;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        child: AnimatedContainer(
          padding:
              padding ??
              const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 20,
              ),
          duration: animatationDuration,
          height: height,
          width: width,
          alignment: width == null ? null : Alignment.center,
          decoration: _getBoxDecoration(context),
          child: child,
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration(BuildContext context) {
    if (onTap == null) {
      return BoxDecoration(
        color: color?.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
      );
    }
    return boxDecoration ??BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: color ?? PackageColors.primary(context),
    );
  }
}
