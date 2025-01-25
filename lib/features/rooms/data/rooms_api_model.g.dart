// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomsApiModel _$RoomsApiModelFromJson(Map<String, dynamic> json) =>
    RoomsApiModel(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomsApiModelToJson(RoomsApiModel instance) =>
    <String, dynamic>{
      'rooms': instance.rooms,
    };

RoomApiModel _$RoomApiModelFromJson(Map<String, dynamic> json) => RoomApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      price_per: json['price_per'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      image_urls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomApiModelToJson(RoomApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.price_per,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.image_urls,
    };
