import 'package:booking_bloc/core/utils/declensions.dart';
import 'package:booking_bloc/core/utils/price_formatter.dart';
import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/features/booking/domain/booking.dart';
import 'package:booking_bloc/theme/theme.dart';
import 'package:flutter/material.dart';

class BookingInfoTable extends StatelessWidget {
  const BookingInfoTable({super.key, required this.booking});
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(17, 16, 17, 17),
        decoration: BoxDecoration(
            color: context.color.blockBackgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Table(
          columnWidths: const {
            0: FractionColumnWidth(0.4),
            1: FractionColumnWidth(0.6)
          },
          children: [
            getTableRow('Вылет из', booking.departure),
            getTableRow('Страна, город', booking.arrivalCountry),
            getTableRow(
                'Даты', '${booking.tourDateStart} – ${booking.tourDateStop}'),
            getTableRow('Кол-во ночей',
                '${booking.numberOfNights} ${nightsDeclension(booking.numberOfNights)}'),
            getTableRow('Отель', booking.hotelName),
            getTableRow('Номер', booking.room),
            getTableRow('Питание', booking.nutrition, isLast: true),
          ],
        ));
  }
}

class PricingTable extends StatelessWidget {
  const PricingTable({super.key, required this.booking});
  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(17, 16, 17, 17),
      decoration: BoxDecoration(
        color: context.color.blockBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Table(
        children: [
          getTableRow('Тур', '${formatPrice(booking.tourPrice)} ₽',
              endAlignValue: true),
          getTableRow('Топливный сбор', '${formatPrice(booking.fuelCharge)} ₽',
              endAlignValue: true),
          getTableRow(
              'Сервисный сбор', '${formatPrice(booking.serviceCharge)} ₽',
              endAlignValue: true),
          TableRow(children: [
            Text('К оплате',
                style: TextStyle(
                  fontSize: 16,
                  color: AppTheme.appColors.secondaryTextColor,
                )),
            Text(
              '${formatPrice(booking.tourPrice + booking.fuelCharge + booking.serviceCharge)} ₽',
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.appColors.addressColor,
              ),
              textAlign: TextAlign.end,
            )
          ]),
        ],
      ),
    );
  }
}

TableRow getTableRow(String infoName, String infoValue,
    {bool isLast = false, bool endAlignValue = false}) {
  final padding = isLast ? EdgeInsets.zero : const EdgeInsets.only(bottom: 18);
  return TableRow(children: [
    Padding(
      padding: padding,
      child: Text(
        infoName,
        style: TextStyle(
          fontSize: 16,
          color: AppTheme.appColors.secondaryTextColor,
        ),
      ),
    ),
    Padding(
      padding: padding,
      child: Text(infoValue,
          style: const TextStyle(fontSize: 16),
          textAlign: endAlignValue ? TextAlign.right : null),
    ),
  ]);
}
