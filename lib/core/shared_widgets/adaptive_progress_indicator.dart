import 'package:booking_bloc/extensions.dart';
import 'package:flutter/material.dart';

class AdaptiveProgressIndicator extends StatelessWidget {
  const AdaptiveProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.adaptiveHeight * 0.75,
        child: const Center(child: CircularProgressIndicator()));
  }
}
