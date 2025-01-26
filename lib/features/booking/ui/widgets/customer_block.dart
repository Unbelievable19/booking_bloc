import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/features/booking/ui/booking_bloc.dart';
import 'package:booking_bloc/features/booking/ui/widgets/email_entry.dart';
import 'package:booking_bloc/features/booking/ui/widgets/phone_entry.dart';
import 'package:booking_bloc/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerBlock extends StatelessWidget {
  const CustomerBlock({
    super.key,
    required this.phoneFormKey,
    required this.emailFormKey,
  });
  final GlobalKey<FormState> phoneFormKey;
  final GlobalKey<FormState> emailFormKey;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingBloc>();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(17, 16, 17, 17),
      margin: const EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
          color: context.color.blockBackgroundColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child:
                Text('Информация о покупателе', style: TextStyle(fontSize: 22)),
          ),
          PhoneEntry(
            controller: cubit.bookingFormManager.phoneNumberController,
            formKey: phoneFormKey,
          ),
          const SizedBox(height: 7),
          EmailEntry(emailFormKey: emailFormKey),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
                'Эти данные никому не передаются. После оплаты мы вышлем чек на указанный вами номер и почту',
                style: TextStyle(
                  fontSize: 14,
                  color: AppTheme.appColors.secondaryTextColor,
                )),
          ),
        ],
      ),
    );
  }
}
