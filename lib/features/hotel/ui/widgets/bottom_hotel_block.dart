import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/features/hotel/domain/hotel.dart';
import 'package:booking_bloc/features/hotel/ui/widgets/details_buttons.dart';
import 'package:flutter/material.dart';

class BottomHotelBlock extends StatelessWidget {
  final Hotel hotel;
  const BottomHotelBlock({super.key, required this.hotel});

  List<String> get peculiarities => hotel.aboutTheHotel.peculiarities;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 7),
            const Row(
              children: [
                Text(
                  'Об отеле',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: peculiarities.map((pec) {
                return Peculiarity(label: pec);
              }).toList(),
            ),
            const SizedBox(height: 12),
            Text(
              hotel.aboutTheHotel.description,
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 20),
            const DetailsButtons(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class Peculiarity extends StatelessWidget {
  const Peculiarity({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
          color: context.color.itemBackgroundColor,
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        label,
        style: TextStyle(color: context.color.secondaryTextColor, fontSize: 16),
      ),
    );
  }
}
