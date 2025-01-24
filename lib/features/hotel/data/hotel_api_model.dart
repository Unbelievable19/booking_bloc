// ignore_for_file: non_constant_identifier_names

import 'package:booking_bloc/features/hotel/domain/hotel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_api_model.g.dart';

@JsonSerializable()
class HotelApiModel {
  int id;
  String name;
  String adress;
  int minimal_price;
  String price_for_it;
  int rating;
  String rating_name;
  List<String> image_urls;
  AboutTheHotelApiModel about_the_hotel;

  HotelApiModel(
      {required this.id,
      required this.name,
      required this.adress,
      required this.minimal_price,
      required this.price_for_it,
      required this.rating,
      required this.rating_name,
      required this.image_urls,
      required this.about_the_hotel});

  factory HotelApiModel.fromJson(Map<String, dynamic> json) =>
      _$HotelApiModelFromJson(json);

  Hotel toCoreModel() {
    return Hotel(
      id: id,
      name: name,
      address: adress,
      minimalPrice: minimal_price,
      priceForIt: price_for_it,
      rating: rating,
      ratingName: rating_name,
      imageUrls: image_urls,
      aboutTheHotel: about_the_hotel.toCoreModel(),
    );
  }
}

@JsonSerializable()
class AboutTheHotelApiModel {
  String description;
  List<String> peculiarities;

  AboutTheHotelApiModel(
      {required this.description, required this.peculiarities});

  factory AboutTheHotelApiModel.fromJson(Map<String, dynamic> json) =>
      _$AboutTheHotelApiModelFromJson(json);

  AboutTheHotel toCoreModel() {
    return AboutTheHotel(
      description: description,
      peculiarities: peculiarities,
    );
  }
}
