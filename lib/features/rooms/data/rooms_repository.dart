import 'package:booking_bloc/features/rooms/data/rooms_api_model.dart';
import 'package:booking_bloc/features/rooms/domain/room.dart';
import 'package:dio/dio.dart';

abstract class RoomsRepository {
  Future<List<Room>> getRooms();
}

class RoomsRepositoryImpl implements RoomsRepository {
  final Dio dio;

  RoomsRepositoryImpl(this.dio);

  @override
  Future<List<Room>> getRooms() async {
    const url = 'https://run.mocky.io/v3/f8a503f2-e4a9-437e-96fb-417871ba6ad7';
    final response = await dio.get(url);

    final json = response.data;
    final roomsApiModel = RoomsApiModel.fromJson(json);

    final rooms = roomsApiModel.rooms.map((e) {
      return e.toCoreModel();
    }).toList();
    return rooms;
  }
}
