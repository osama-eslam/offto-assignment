import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerCalendar extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? departDate;
  final DateTime? arriveDate;
  final Function(DateTime) onDateSelected;

  const DatePickerCalendar({
    super.key,
    required this.focusedDay,
    this.departDate,
    this.arriveDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final Color todayColor = isDarkMode
        ? Colors.blueAccent.withOpacity(0.7)
        : Color.fromARGB(255, 109, 223, 115).withOpacity(0.7);

    final Color selectionColor = isDarkMode ? Colors.tealAccent : Colors.green;

    final Color rangeColor = isDarkMode
        ? const Color.fromARGB(255, 45, 165, 137).withOpacity(0.3)
        : Colors.green.withOpacity(0.3);

    return TableCalendar(
      firstDay: DateTime(2022),
      lastDay: DateTime(2030),
      focusedDay: focusedDay,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      selectedDayPredicate: (day) {
        return (departDate != null && departDate!.isAtSameMomentAs(day)) ||
            (arriveDate != null && arriveDate!.isAtSameMomentAs(day));
      },
      rangeStartDay: departDate,
      rangeEndDay: arriveDate,
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      onDaySelected: (selectedDay, _) => onDateSelected(selectedDay),
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        selectedDecoration: BoxDecoration(
          color: selectionColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: todayColor,
          shape: BoxShape.circle,
        ),
        withinRangeDecoration: BoxDecoration(
          color: rangeColor,
          shape: BoxShape.rectangle,
        ),
        selectedTextStyle: TextStyle(
          color: isDarkMode ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
        todayTextStyle: TextStyle(
          color: isDarkMode ? Colors.black : Colors.white,
          fontWeight: FontWeight.bold,
        ),
        withinRangeTextStyle: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
