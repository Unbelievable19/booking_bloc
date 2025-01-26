import 'dart:math';

import 'package:booking_bloc/core/shared_widgets/bottom_button_sheet.dart';
import 'package:booking_bloc/core/shared_widgets/shared_app_bar.dart';
import 'package:booking_bloc/extensions.dart';
import 'package:booking_bloc/theme/theme.dart';
import 'package:flutter/material.dart';

class PaidScreen extends StatelessWidget {
  static const id = 'PaidScreen';
  const PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.blockBackgroundColor,
      bottomSheet: BottomButtonSheet(
        buttonText: 'Супер!',
        onPressed: () => Navigator.pushNamed(context, '/'),
      ),
      body: CustomScrollView(
        slivers: [
          const SharedAppBar(titleAppBar: 'Заказ оплачен'),
          SliverToBoxAdapter(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 175),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: context.adaptiveHeight * 0.17),
                  CircleAvatar(
                    backgroundColor: context.theme.scaffoldBackgroundColor,
                    radius: 80,
                    child: Image.asset(
                      'assets/icons/party-popper1.png',
                      scale: 1.5,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text('Ваш заказ принят в работу',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 20),
                    child: Text(
                      '''Подтверждение заказа №${Random().nextInt(100000) + 100000} может занять некоторое время (от 1 часа до суток). '''
                      '''Как только мы получим ответ от туроператора, вам на почту придет уведомление.''',
                      textAlign: TextAlign.center,
                      // style: AppFonts.paidLabel,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'SFProDisplay400',
                        color: AppTheme.appColors.secondaryTextColor,
                        height: 1.2,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
