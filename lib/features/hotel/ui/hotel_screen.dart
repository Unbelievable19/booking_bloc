import 'package:booking_bloc/core/shared_widgets/bottom_button_sheet.dart';
import 'package:booking_bloc/core/shared_widgets/shared_app_bar.dart';
import 'package:booking_bloc/features/hotel/ui/hotel_bloc.dart';
import 'package:booking_bloc/features/hotel/ui/widgets/bottom_hotel_block.dart';
import 'package:booking_bloc/features/hotel/ui/widgets/top_hotel_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(titleAppBar: "Отель"),
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          switch (state) {
            case HotelLoading _:
              return const Center(child: CircularProgressIndicator());
            case HotelError error:
              return Center(child: Text(error.reason));
            case HotelLoaded loadedState:
              final hotel = loadedState.hotel;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TopHotelBlock(hotel: hotel),
                            const SizedBox(height: 8),
                            BottomHotelBlock(hotel: hotel),
                            const SizedBox(height: 12),
                          ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BottomButtonSheet(
                      buttonText: 'К выбору номера',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              );
            default:
              throw Exception('Неизвестная ошибка');
          }
        },
      ),
    );
  }
}
