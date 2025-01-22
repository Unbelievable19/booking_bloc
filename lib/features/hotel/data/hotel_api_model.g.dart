// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelApiModel _$HotelApiModelFromJson(Map<String, dynamic> json) =>
    HotelApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      adress: json['adress'] as String,
      minimal_price: (json['minimal_price'] as num).toInt(),
      price_for_it: json['price_for_it'] as String,
      rating: (json['rating'] as num).toInt(),
      rating_name: json['rating_name'] as String,
      image_urls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      about_the_hotel: AboutTheHotelApiModel.fromJson(
          json['about_the_hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelApiModelToJson(HotelApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.adress,
      'minimal_price': instance.minimal_price,
      'price_for_it': instance.price_for_it,
      'rating': instance.rating,
      'rating_name': instance.rating_name,
      'image_urls': instance.image_urls,
      'about_the_hotel': instance.about_the_hotel,
    };

AboutTheHotelApiModel _$AboutTheHotelApiModelFromJson(
        Map<String, dynamic> json) =>
    AboutTheHotelApiModel(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutTheHotelApiModelToJson(
        AboutTheHotelApiModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
