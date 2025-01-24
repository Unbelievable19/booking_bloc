import 'package:booking_bloc/core/utils/price_formatter.dart';
import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/features/hotel/domain/hotel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TopHotelBlock extends StatelessWidget {
  final Hotel hotel;
  const TopHotelBlock({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gallery(),
            const SizedBox(height: 16),
            Rating(rating: hotel.rating, ratingName: hotel.ratingName),
            const SizedBox(height: 9),
            Text(
              hotel.name,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 3),
            Text(
              hotel.address,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: context.color.addressColor,
              ),
            ),
            const SizedBox(height: 6),
            getPriceRow(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget getPriceRow() {
    final priceFormatted = formatPrice(hotel.minimalPrice);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      children: [
        Text(
          "от $priceFormatted ₽",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(" ${hotel.priceForIt.toLowerCase()}",
            style: const TextStyle(
              height: 2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ))
      ],
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  static const url =
      "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg";
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          height: context.adaptiveWidth * 0.66,
          imageUrl: url,
        ));
  }
}

class Rating extends StatelessWidget {
  const Rating({super.key, required this.rating, required this.ratingName});
  final int rating;
  final String ratingName;

  @override
  Widget build(BuildContext context) {
    final textColor = rating == 5
        ? context.color.bestRatingTextColor
        : context.color.anyRatingTextColor;
    final backgroundColor = rating == 5
        ? context.color.bestRatingBackgroundColor
        : context.color.anyRatingBackgroundColor;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.5, horizontal: 10),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: textColor, size: 18),
          Text(
            '$rating $ratingName',
            style: TextStyle(fontSize: 16, color: textColor),
          )
        ],
      ),
    );
  }
}
