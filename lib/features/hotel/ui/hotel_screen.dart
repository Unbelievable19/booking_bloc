import 'package:booking_bloc/features/hotel/data/hotel_repository.dart';
import 'package:booking_bloc/features/hotel/ui/hotel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          switch (state) {
            case HotelLoading _:
              return Center(child: CircularProgressIndicator());
            case HotelError error:
              return Center(child: Text(error.reason));
            case HotelLoaded loadedState:
              final hotel = loadedState.hotel;
              return SingleChildScrollView(
                
              );
            default:
              throw Exception('Неизвестная ошибка');
          }
        },
      ),
    );
  }
}