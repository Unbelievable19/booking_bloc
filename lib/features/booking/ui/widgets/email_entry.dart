import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/features/booking/ui/booking_bloc.dart';
import 'package:booking_bloc/features/booking/ui/widgets/field_wrapper.dart';
import 'package:booking_bloc/features/booking/ui/widgets/phone_entry.dart';
import 'package:booking_bloc/theme/theme.dart';
import 'package:email_validator/email_validator.dart';
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
    final bloc = context.read<BookingBloc>();
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
            child: Text('Информация о покупателе',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                )),
          ),
          PhoneEntry(
            controller: bloc.bookingFormManager.phoneNumberController,
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

class EmailEntry extends StatefulWidget {
  const EmailEntry({super.key, required this.emailFormKey});
  final GlobalKey<FormState> emailFormKey;

  @override
  State<EmailEntry> createState() => _EmailEntryState();
}

class _EmailEntryState extends State<EmailEntry> {
  Color? emailFillColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.emailFormKey,
      child: Focus(
        onFocusChange: (hasFocus) {
          if (!hasFocus) {
            widget.emailFormKey.currentState?.validate();
          }
        },
        child: FieldWrapper(
          fillColor: emailFillColor,
          child: TextFormField(
              controller: context
                  .read<BookingBloc>()
                  .bookingFormManager
                  .emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Введите email',
                  labelText: 'Email',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  hintStyle: TextStyle(
                    color: AppTheme.appColors.textFieldHintColor,
                  )),
              validator: (value) {
                if (!EmailValidator.validate(value ?? '', false, false)) {
                  setState(() {
                    emailFillColor = context.color.formErrorColor;
                  });
                  return '';
                } else {
                  setState(() {
                    emailFillColor = context.theme.scaffoldBackgroundColor;
                  });
                  return null;
                }
              }),
        ),
      ),
    );
  }
}
