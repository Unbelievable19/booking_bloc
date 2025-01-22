import 'package:booking_bloc/features/hotel/data/hotel_repository.dart';
import 'package:booking_bloc/features/hotel/ui/hotel_bloc.dart';
import 'package:booking_bloc/features/hotel/ui/hotel_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HotelBloc(HotelRepositoryImpl(Dio()))..add(FetchHotelEvent()),
        child: const HotelScreen(),
      )
    );
    }
}
