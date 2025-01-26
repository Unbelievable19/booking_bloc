import 'package:booking_bloc/features/hotel/ui/widgets/top_hotel_block.dart';
import 'package:booking_bloc/theme/theme.dart';
import 'package:flutter/material.dart';

class MainHotelInfo extends StatelessWidget {
  const MainHotelInfo({
    super.key,
    required this.rating,
    required this.ratingName,
    required this.hotelName,
    required this.address,
  });

  final int rating;
  final String ratingName;
  final String hotelName;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Rating(
          rating: rating,
          ratingName: ratingName,
        ),
        Text(
          hotelName,
          style: const TextStyle(fontSize: 22),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(7),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            address,
            style: TextStyle(
              color: AppTheme.appColors.addressColor,
            ),
          ),
        ),
      ],
    );
  }
}
