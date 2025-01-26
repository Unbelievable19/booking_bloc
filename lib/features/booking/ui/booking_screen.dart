import 'package:booking_bloc/core/shared_widgets/adaptive_progress_indicator.dart';
import 'package:booking_bloc/core/shared_widgets/bottom_button_sheet.dart';
import 'package:booking_bloc/core/shared_widgets/shared_app_bar.dart';
import 'package:booking_bloc/core/utils/price_formatter.dart';
import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/features/booking/ui/booking_bloc.dart';
import 'package:booking_bloc/features/booking/ui/paid_screen.dart';
import 'package:booking_bloc/features/booking/ui/widgets/add_tourist.dart';
import 'package:booking_bloc/features/booking/ui/widgets/booking_tables.dart';
import 'package:booking_bloc/features/booking/ui/widgets/email_entry.dart';
import 'package:booking_bloc/features/booking/ui/widgets/main_hotel_info.dart';
import 'package:booking_bloc/features/booking/ui/widgets/tourist_block.dart';
import 'package:booking_bloc/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});
  static const id = 'BookingScreen';

  static final ScrollController scrollController = ScrollController();
  static final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> touristsFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              const SharedAppBar(titleAppBar: 'Бронирование'),
              const SliverToBoxAdapter(child: SizedBox(height: 12)),
              SliverToBoxAdapter(
                child: BlocBuilder<BookingBloc, BookingState>(
                  builder: (context, state) {
                    switch (state) {
                      case BookingLoading _:
                        return const AdaptiveProgressIndicator();
                      case BookingError error:
                        return Center(child: Text(error.reason));
                      case BookingLoaded loadedState:
                        final booking = loadedState.booking;
                        final tourists = state.touristsInfo;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(17, 8, 17, 19),
                              decoration: BoxDecoration(
                                  color: context.color.blockBackgroundColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: MainHotelInfo(
                                rating: booking.horating,
                                ratingName: booking.ratingName,
                                hotelName: booking.hotelName,
                                address: booking.hotelAddress,
                              ),
                            ),
                            const SizedBox(height: 8),
                            BookingInfoTable(booking: booking),
                            CustomerBlock(
                              phoneFormKey: phoneFormKey,
                              emailFormKey: emailFormKey,
                            ),
                            Form(
                                key: touristsFormKey,
                                child: Column(
                                  children: List.generate(
                                    tourists.length,
                                    (index) => TouristBlock(
                                        touristInfo: tourists[index],
                                        id: index + 1),
                                  ),
                                )),
                            AddTourist(scrollController: scrollController),
                            PricingTable(booking: booking),
                            const SizedBox(height: 82),
                          ],
                        );
                    }
                    throw Exception('should not happen :)');
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BookingBottomSheet(
                phoneFormKey: phoneFormKey,
                emailFormKey: emailFormKey,
                touristsFormKey: touristsFormKey),
          )
        ],
      ),
    );
  }
}

class BookingBottomSheet extends StatelessWidget {
  const BookingBottomSheet({
    super.key,
    required this.phoneFormKey,
    required this.emailFormKey,
    required this.touristsFormKey,
  });

  final GlobalKey<FormState> phoneFormKey;
  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> touristsFormKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state is BookingLoaded) {
          final totalPrice = state.booking.tourPrice +
              state.booking.fuelCharge +
              state.booking.serviceCharge;
          return BottomButtonSheet(
            buttonText: 'Оплатить ${formatPrice(totalPrice)} ₽',
            onPressed: () {
              if (context.read<BookingBloc>().validateForms(
                  [phoneFormKey, emailFormKey, touristsFormKey])) {
                // убираем фокус с полей чтобы не оставалась клавиатура
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushNamed(PaidScreen.id);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 2),
                  content: Text(
                    'Пожалуйста, проверьте корректность введенных данных',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.appColors.textColor,
                    ),
                  ),
                  backgroundColor: context.theme.scaffoldBackgroundColor,
                ));
              }
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
