import 'package:booking_bloc/features/booking/data/booking_api_model.dart';
import 'package:booking_bloc/features/booking/domain/booking.dart';
import 'package:dio/dio.dart';

abstract class BookingRepository {
  Future<Booking> getBooking();
}

class BookingRepositoryImpl implements BookingRepository {
  final Dio dio;
  BookingRepositoryImpl(this.dio);

  @override
  Future<Booking> getBooking() async {
    const url = "https://run.mocky.io/v3/f5abd638-11e2-4445-8575-ba05f954867c";
    final response = await dio.get(url);

    final bookingApiModel = BookingApiModel.fromJson(response.data);
    final booking = bookingApiModel.toCoreModel();
    return booking;
  }
}
