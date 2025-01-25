import 'package:booking_bloc/features/rooms/data/rooms_repository.dart';
import 'package:booking_bloc/features/rooms/ui/rooms_bloc.dart';
import 'package:booking_bloc/features/rooms/ui/rooms_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case RoomsScreen.id:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) =>
                RoomsBloc(RoomsRepositoryImpl(Dio()))..add(FetchRoomsEvent()),
            child: const RoomsScreen(),
          );
        });
      default:
        return _errorRoute(settings.name);
    }
  }

  static Route<dynamic> _errorRoute(String? name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('ROUTE \n\n$name\n\nNOT FOUND'),
        ),
      ),
    );
  }
}
