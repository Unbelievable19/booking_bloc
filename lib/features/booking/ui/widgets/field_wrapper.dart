import 'package:booking_bloc/extensions.dart';
import 'package:flutter/material.dart';

class FieldWrapper extends StatelessWidget {
  const FieldWrapper({super.key, this.fillColor, required this.child});
  final Widget child;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: fillColor ?? context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }
}
