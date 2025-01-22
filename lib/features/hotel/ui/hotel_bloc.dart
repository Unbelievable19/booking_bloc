import 'package:booking_bloc/features/hotel/data/hotel_repository.dart';
import 'package:booking_bloc/features/hotel/domain/hotel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final HotelRepository hotelRepo;
  HotelBloc(this.hotelRepo) : super(HotelLoading()) {
    on<FetchHotelEvent>((event, emit) async {
      emit(HotelLoading());
      try {
        final hotel = await hotelRepo.getHotel();
        emit(HotelLoaded(hotel));
      } on Exception {
        emit(HotelError("Ошибка соединения"));
      }
    });
  }
}

abstract class HotelEvent {}

class FetchHotelEvent implements HotelEvent{}

abstract class HotelState {}

class HotelLoading implements HotelState {}

class HotelError implements HotelState {
  final String reason;

  HotelError(this.reason);
}

class HotelLoaded implements HotelState {
  final Hotel hotel;

  HotelLoaded(this.hotel);
}