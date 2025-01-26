import 'package:booking_bloc/features/booking/data/booking_repository.dart';
import 'package:booking_bloc/features/booking/domain/booking.dart';
import 'package:booking_bloc/features/booking/domain/booking_form_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository bookingRepo;
  final BookingFormManager bookingFormManager;

  BookingBloc(this.bookingRepo, this.bookingFormManager)
      : super(BookingLoading()) {
    on<FetchBookingEvent>((event, emit) async {
      try {
        final booking = await bookingRepo.getBooking();
        emit(BookingLoaded(
          booking: booking,
          touristsInfo: bookingFormManager.touristsInfo,
        ));
      } on Exception {
        emit(BookingError("Ошибка соединения"));
      }
    });
    on<AddTouristEvent>((event, emit) async {
      bookingFormManager.addTouristInfo(TouristInfo());
      if (state is BookingLoaded) {
        emit(BookingLoaded(
          booking: (state as BookingLoaded).booking,
          touristsInfo: bookingFormManager.touristsInfo,
        ));
      }
    });
  }

  bool validateForms(List<GlobalKey<FormState>> keys) {
    return _validateAll(keys) && _validateTouristsEmptyFields();
  }

  bool _validateTouristsEmptyFields() {
    return bookingFormManager.validateTouristsEmptyFields();
  }

  bool _validateAll(List<GlobalKey<FormState>> keys) {
    bool isValid = true;
    for (var key in keys) {
      if (!key.currentState!.validate()) {
        isValid = false;
      }
    }
    return isValid;
  }
}

abstract class BookingEvent {}

class FetchBookingEvent implements BookingEvent {}

class AddTouristEvent implements BookingEvent {}

abstract class BookingState {}

class BookingLoading implements BookingState {}

class BookingError implements BookingState {
  final String reason;
  BookingError(this.reason);
}

class BookingLoaded implements BookingState {
  final Booking booking;
  final List<TouristInfo> touristsInfo;

  BookingLoaded({required this.booking, required this.touristsInfo});
}
