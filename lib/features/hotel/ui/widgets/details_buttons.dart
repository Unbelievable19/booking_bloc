import 'package:booking_bloc/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsButtons extends StatelessWidget {
  const DetailsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: context.color.itemBackgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          DetailItem(
              icon: SvgPicture.asset(
                'assets/icons/emoji-happy.svg',
              ),
              name: 'Удобства',
              value: 'Самое необходимое'),
          const Divider(indent: 50, endIndent: 16, thickness: 1),
          DetailItem(
            icon: SvgPicture.asset('assets/icons/tick-square.svg'),
            name: 'Что включено',
            value: 'Самое необходимое',
          ),
          const Divider(indent: 50, endIndent: 16, thickness: 1),
          DetailItem(
            icon: SvgPicture.asset('assets/icons/close-square.svg'),
            name: 'Что не включено',
            value: 'Самое необходимое',
          ),
        ],
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
  });
  final SvgPicture icon;
  final String name;
  final String value;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.8, horizontal: 14),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: context.color.secondaryTextColor,
                  ),
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset('assets/icons/arrow_right.svg'),
          ],
        ),
      ),
    );
  }
}
