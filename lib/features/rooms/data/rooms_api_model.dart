// ignore_for_file: non_constant_identifier_names

import 'package:booking_bloc/features/rooms/domain/room.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rooms_api_model.g.dart';

@JsonSerializable()
class RoomsApiModel {
  List<RoomApiModel> rooms;

  RoomsApiModel({required this.rooms});

  factory RoomsApiModel.fromJson(Map<String, dynamic> json) =>
      _$RoomsApiModelFromJson(json);
}

@JsonSerializable()
class RoomApiModel {
  int id;
  String name;
  int price;
  String price_per;
  List<String> peculiarities;
  List<String> image_urls;

  RoomApiModel({
    required this.id,
    required this.name,
    required this.price,
    required this.price_per,
    required this.peculiarities,
    required this.image_urls,
  });

  factory RoomApiModel.fromJson(Map<String, dynamic> json) =>
      _$RoomApiModelFromJson(json);

  Room toCoreModel() {
    return Room(
      id: id,
      name: name,
      price: price,
      pricePer: price_per,
      peculiarities: peculiarities,
      imageUrls: image_urls,
    );
  }
}
