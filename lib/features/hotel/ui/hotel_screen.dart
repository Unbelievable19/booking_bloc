import 'package:booking_bloc/core/shared_widgets/shared_app_bar.dart';
import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/features/hotel/data/hotel_repository.dart';
import 'package:booking_bloc/features/hotel/domain/hotel.dart';
import 'package:booking_bloc/features/hotel/ui/hotel_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(titleAppBar: "Отель"),
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          switch (state) {
            case HotelLoading _:
              return const Center(child: CircularProgressIndicator());
            case HotelError error:
              return Center(child: Text(error.reason));
            case HotelLoaded loadedState:
              final hotel = loadedState.hotel;
              return SingleChildScrollView(
                child: Column(children: [
                  TopHotelBlock(hotel: hotel),
                ]),
              );
            default:
              throw Exception('Неизвестная ошибка');
          }
        },
      ),
    );
  }
}

class TopHotelBlock extends StatelessWidget {
  final Hotel hotel;
  const TopHotelBlock({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
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
            Text(hotel.name, style: const TextStyle(height: 15))
          ],
        ),
      ),
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
        child: CachedNetworkImage(imageUrl: url));
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
