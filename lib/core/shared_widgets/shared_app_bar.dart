import 'package:booking_bloc/extensions.dart';
import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;

  SharedAppBar({super.key, required this.titleAppBar});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      scrolledUnderElevation: 0,
      backgroundColor: context.color.blockBackgroundColor,
      title: Text(
        titleAppBar,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
