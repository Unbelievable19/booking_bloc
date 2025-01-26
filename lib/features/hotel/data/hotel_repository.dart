// https://run.mocky.io/v3/079004b0-a5be-41bd-a586-e25e1eedcb1f

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
    const url = 'https://run.mocky.io/v3/e4045619-1aa7-4a45-a5aa-2bf958f9d4d0';
    final response = await dio.get(url);

    final json = response.data;
    final hotelApiModel = HotelApiModel.fromJson(json);

    final hotel = hotelApiModel.toCoreModel();
    return hotel;
  }
}
