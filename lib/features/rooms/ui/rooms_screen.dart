import 'package:booking_bloc/core/shared_widgets/adaptive_progress_indicator.dart';
import 'package:booking_bloc/core/shared_widgets/carousel.dart';
import 'package:booking_bloc/core/shared_widgets/shared_app_bar.dart';
import 'package:booking_bloc/features/rooms/domain/room.dart';
import 'package:booking_bloc/features/rooms/ui/rooms_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsScreen extends StatelessWidget {
  static const id = 'RoomsScreen';
  const RoomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SharedAppBar(titleAppBar: 'Выбор номера'),
          BlocBuilder<RoomsBloc, RoomsState>(builder: (context, state) {
            switch (state) {
              case RoomsLoading _:
                return const SliverToBoxAdapter(
                    child: AdaptiveProgressIndicator());
              case RoomsError error:
                return SliverToBoxAdapter(
                    child: Center(child: Text(error.reason)));
              case RoomsLoaded loadedState:
                return Expanded(
                  child: SliverList.separated(
                    itemCount: loadedState.rooms.length,
                    itemBuilder: (context, index) {
                      final room = loadedState.rooms[index];
                      return RoomTile(room: room);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                  ),
                );
              default:
                throw Exception('shit happens');
            }
          })
        ],
      ),
    );
  }
}

class RoomTile extends StatelessWidget {
  const RoomTile({super.key, required this.room});
  final Room room;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageCarousel(imageUrls: room.imageUrls),
      ],
    );
  }
}
