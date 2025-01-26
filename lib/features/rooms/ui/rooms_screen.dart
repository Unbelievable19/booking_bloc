import 'package:booking_bloc/core/shared_widgets/adaptive_progress_indicator.dart';
import 'package:booking_bloc/core/shared_widgets/carousel.dart';
import 'package:booking_bloc/core/shared_widgets/shared_app_bar.dart';
import 'package:booking_bloc/core/utils/price_formatter.dart';
import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/features/hotel/ui/widgets/bottom_hotel_block.dart';
import 'package:booking_bloc/features/rooms/domain/room.dart';
import 'package:booking_bloc/features/rooms/ui/rooms_bloc.dart';
import 'package:flutter/cupertino.dart';
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
          const SharedAppBar(titleAppBar: 'Выбор номера'),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
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
          }),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
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
    return Container(
      decoration: BoxDecoration(
        color: context.color.blockBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarousel(imageUrls: room.imageUrls),
            const SizedBox(height: 10),
            Text(
              room.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 5),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: room.peculiarities.map((pec) {
                return Peculiarity(label: pec);
              }).toList(),
            ),
            const SizedBox(
              height: 5,
            ),
            const AboutRoomButton(),
            const SizedBox(height: 10),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                Text(
                  "${formatPrice(room.price)} ₽",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  " ${room.pricePer.toLowerCase()}",
                  style: const TextStyle(
                    height: 2,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: CupertinoButton(
                        borderRadius: BorderRadius.circular(15),
                        color: context.color.addressColor,
                        onPressed: () {},
                        child: const Text(
                          "Выбрать номер",
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutRoomButton extends StatelessWidget {
  const AboutRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: context.color.anyRatingBackgroundColor,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Подробнее о номере",
              style: TextStyle(
                color: context.color.anyRatingTextColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: context.color.anyRatingTextColor,
            )
          ],
        ),
      ),
    );
  }
}
