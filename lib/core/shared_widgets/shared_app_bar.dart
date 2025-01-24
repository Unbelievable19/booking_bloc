import 'package:booking_bloc/extensions.dart';
import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;

  SharedAppBar({super.key, required this.titleAppBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: context.color.blockBackgroundColor,
      title: Text(
        titleAppBar,
        // style: const TextStyle(fontFamily: ''),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
