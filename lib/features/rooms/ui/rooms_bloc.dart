import 'package:booking_bloc/features/rooms/data/rooms_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/room.dart';

class RoomsBloc extends Bloc<RoomsEvent, RoomsState> {
  final RoomsRepository roomsRepo;
  RoomsBloc(this.roomsRepo) : super(RoomsLoading()) {
    on<FetchRoomsEvent>((event, emit) async {
      emit(RoomsLoading());
      try {
        final rooms = await roomsRepo.getRooms();
        emit(RoomsLoaded(rooms));
      } on Exception {
        emit(RoomsError("Ошибка соединения"));
      }
    });
  }
}

abstract class RoomsEvent {}

class FetchRoomsEvent implements RoomsEvent {}

abstract class RoomsState {}

class RoomsLoading implements RoomsState {}

class RoomsError implements RoomsState {
  final String reason;

  RoomsError(this.reason);
}

class RoomsLoaded implements RoomsState {
  final List<Room> rooms;

  RoomsLoaded(this.rooms);
}
