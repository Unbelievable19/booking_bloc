import 'package:booking_bloc/extensions.dart';
import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;

  const SharedAppBar({super.key, required this.titleAppBar});

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
      automaticallyImplyLeading: false,
      leading: Navigator.of(context).canPop()
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.black,
              iconSize: 24,
              onPressed: () => Navigator.of(context).pop(),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
