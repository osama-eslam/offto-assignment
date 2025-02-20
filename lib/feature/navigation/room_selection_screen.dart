import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/feature/bloc/RoomSelectionCubit.dart';
import 'package:hotel_booking_app/generated/l10n.dart';
import 'package:hotel_booking_app/widget/room_selection/CloseButtonWidget.dart';
import 'package:hotel_booking_app/widget/room_selection/add_room_button.dart';
import 'package:hotel_booking_app/widget/room_selection/counter_widget.dart';

class RoomSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => RoomSelectionCubit(),
      child: BlocBuilder<RoomSelectionCubit, List<Map<String, int>>>(
        builder: (context, rooms) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[900] : Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).passengersRooms,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    CloseButtonWidget(
                      onClose: () => _submitSelection(context, rooms),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(rooms.length, (index) {
                        return _buildRoomCard(
                            context, index, rooms[index], isDarkMode);
                      }),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AddRoomButton(
                  rooms: rooms.length,
                  adults: rooms.fold(0, (sum, room) => sum + room["adults"]!),
                  updateCount: (_, __) =>
                      context.read<RoomSelectionCubit>().addRoom(),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => _submitSelection(context, rooms),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDarkMode ? Colors.teal[700] : const Color(0xFF00B4B9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 120),
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: Text(S.of(context).done,
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRoomCard(
      BuildContext context, int index, Map<String, int> room, bool isDarkMode) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: isDarkMode ? Colors.grey[700]! : Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[800] : const Color(0xFFF0F5FA),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${S.of(context).room} ${index + 1}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : const Color(0xFF3287AF),
                  ),
                ),
                if (context.read<RoomSelectionCubit>().state.length > 1)
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline,
                        color: Colors.red),
                    onPressed: () =>
                        context.read<RoomSelectionCubit>().removeRoom(index),
                  ),
              ],
            ),
          ),
          CounterWidget(
            label: S.of(context).adult,
            type: "adults",
            count: room["adults"]!,
            ageRange: S.of(context).above11Years,
            updateCount: (type, change) => context
                .read<RoomSelectionCubit>()
                .updateRoom(index, type, change),
          ),
          CounterWidget(
            label: S.of(context).child,
            type: "children",
            count: room["children"]!,
            ageRange: S.of(context).years2To11,
            updateCount: (type, change) => context
                .read<RoomSelectionCubit>()
                .updateRoom(index, type, change),
          ),
          CounterWidget(
            label: S.of(context).infant,
            type: "infants",
            count: room["infants"]!,
            ageRange: S.of(context).lessThan1Year,
            updateCount: (type, change) => context
                .read<RoomSelectionCubit>()
                .updateRoom(index, type, change),
          ),
        ],
      ),
    );
  }

  void _submitSelection(BuildContext context, List<Map<String, int>> rooms) {
    int totalRooms = rooms.length;
    int totalAdults = rooms.fold(0, (sum, room) => sum + room["adults"]!);
    int totalChildren = rooms.fold(0, (sum, room) => sum + room["children"]!);
    int totalInfants = rooms.fold(0, (sum, room) => sum + room["infants"]!);

    Navigator.pop(context, {
      "rooms": totalRooms,
      "adults": totalAdults,
      "children": totalChildren,
      "infants": totalInfants
    });
  }
}
