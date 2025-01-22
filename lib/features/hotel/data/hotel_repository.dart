// https://run.mocky.io/v3/079004b0-a5be-41bd-a586-e25e1eedcb1f

import 'dart:convert';

import 'package:booking_bloc/features/hotel/data/hotel_api_model.dart';
import 'package:booking_bloc/features/hotel/domain/hotel.dart';
import 'package:dio/dio.dart';

abstract class HotelRepository {
  Future<Hotel> getHotel();
}

class HotelRepositoryImpl implements HotelRepository {
  final Dio dio;

  HotelRepositoryImpl(this.dio);

  @override
  Future<Hotel> getHotel() async {
    const url = 'https://run.mocky.io/v3/079004b0-a5be-41bd-a586-e25e1eedcb1f';
    final response = await dio.get(url);

    final json = jsonDecode(response.data) as Map<String, dynamic>;
    final hotelApiModel = HotelApiModel.fromJson(json);
    
    final hotel = hotelApiModel.toCoreModel();
    return hotel;
  }
}