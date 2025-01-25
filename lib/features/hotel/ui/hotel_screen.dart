import 'package:booking_bloc/core/shared_widgets/bottom_button_sheet.dart';
import 'package:booking_bloc/core/shared_widgets/shared_app_bar.dart';
import 'package:booking_bloc/features/hotel/ui/hotel_bloc.dart';
import 'package:booking_bloc/features/hotel/ui/widgets/bottom_hotel_block.dart';
import 'package:booking_bloc/features/hotel/ui/widgets/top_hotel_block.dart';
import 'package:booking_bloc/features/rooms/ui/rooms_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/shared_widgets/adaptive_progress_indicator.dart';

class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: SharedAppBar(titleAppBar: "Отель"),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SharedAppBar(titleAppBar: "Отель"),
              SliverToBoxAdapter(
                child: BlocBuilder<HotelBloc, HotelState>(
                  builder: (context, state) {
                    switch (state) {
                      case HotelLoading _:
                        return const AdaptiveProgressIndicator();
                      case HotelError error:
                        return Center(child: Text(error.reason));
                      case HotelLoaded loadedState:
                        final hotel = loadedState.hotel;
                        return Column(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TopHotelBlock(hotel: hotel),
                                  const SizedBox(height: 8),
                                  BottomHotelBlock(hotel: hotel),
                                  const SizedBox(height: 12),
                                ]),
                            const SizedBox(height: 96),
                          ],
                        );
                      default:
                        throw Exception('Неизвестная ошибка');
                    }
                  },
                ),
              ),
            ],
          ),
          BlocBuilder<HotelBloc, HotelState>(builder: (context, state) {
            if (state is! HotelLoaded) {
              return const SizedBox.shrink();
            }
            return Align(
              alignment: Alignment.bottomCenter,
              child: BottomButtonSheet(
                buttonText: 'К выбору номера',
                onPressed: () {
                  Navigator.pushNamed(context, RoomsScreen.id);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
