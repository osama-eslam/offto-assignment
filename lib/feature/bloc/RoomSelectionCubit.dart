import 'package:flutter_bloc/flutter_bloc.dart';

class RoomSelectionCubit extends Cubit<List<Map<String, int>>> {
  static List<Map<String, int>> _cachedRooms = [
    {"adults": 2, "children": 0, "infants": 0}
  ];

  RoomSelectionCubit() : super(List<Map<String, int>>.from(_cachedRooms));

  void addRoom() {
    _cachedRooms.add({"adults": 1, "children": 0, "infants": 0});
    emit(List<Map<String, int>>.from(_cachedRooms));
  }

  void updateRoom(int index, String type, int change) {
    if (type == "adults") {
      _cachedRooms[index]["adults"] =
          (_cachedRooms[index]["adults"]! + change).clamp(1, 6);
    } else if (type == "children") {
      _cachedRooms[index]["children"] =
          (_cachedRooms[index]["children"]! + change).clamp(0, 4);
    } else if (type == "infants") {
      _cachedRooms[index]["infants"] =
          (_cachedRooms[index]["infants"]! + change).clamp(0, 4);
    }
    emit(List<Map<String, int>>.from(_cachedRooms));
  }

  void removeRoom(int index) {
    if (_cachedRooms.length > 1) {
      _cachedRooms.removeAt(index);
      emit(List<Map<String, int>>.from(_cachedRooms));
    }
  }
}
