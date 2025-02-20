import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_app/feature/bloc/bloc_DatePicker.dart';
import 'package:hotel_booking_app/generated/l10n.dart';
import 'package:hotel_booking_app/widget/date_picker/date_picker_calendar.dart';
import 'package:hotel_booking_app/widget/date_picker/date_picker_text_field.dart';
import 'package:intl/intl.dart';

class DatePickerModal extends StatefulWidget {
  const DatePickerModal({super.key});

  @override
  _DatePickerModalState createState() => _DatePickerModalState();
}

class _DatePickerModalState extends State<DatePickerModal> {
  DateTime? _departDate;
  DateTime? _arriveDate;
  DateTime _focusedDay = DateTime.now();

  final TextEditingController _departController = TextEditingController();
  final TextEditingController _arriveController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final dateCubit = context.read<DatePickerCubit>();

    setState(() {
      _departDate = dateCubit.state["depart"] as DateTime?;
      _arriveDate = dateCubit.state["arrive"] as DateTime?;
      _departController.text = _departDate != null
          ? DateFormat('dd MMM, yy').format(_departDate!)
          : '';
      _arriveController.text = _arriveDate != null
          ? DateFormat('dd MMM, yy').format(_arriveDate!)
          : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color? backgroundColor = isDarkMode ? Colors.grey[900] : Colors.white;
    final Color headerColor =
        isDarkMode ? Colors.tealAccent : const Color(0xFF467AA8);
    final Color closeIconColor = isDarkMode ? Colors.grey : Colors.grey;

    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, headerColor, closeIconColor),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DatePickerTextField(
                          label: S.of(context).depart,
                          controller: _departController,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DatePickerTextField(
                          label: S.of(context).arrive,
                          controller: _arriveController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  DatePickerCalendar(
                    focusedDay: _focusedDay,
                    departDate: _departDate,
                    arriveDate: _arriveDate,
                    onDateSelected: _onDateSelected,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildConfirmButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, Color textColor, Color closeIconColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).travelDates,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.close, color: closeIconColor, size: 28),
        ),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color buttonColor = isDarkMode ? Colors.tealAccent : Colors.teal;
    final Color textColor = isDarkMode ? Colors.black : Colors.white;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (_departDate != null && _arriveDate != null) {
            context
                .read<DatePickerCubit>()
                .setDates(_departDate!, _arriveDate!);
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Text(
          S.of(context).confirm,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }

  void _onDateSelected(DateTime selectedDay) {
    setState(() {
      _focusedDay = selectedDay;

      if (_departDate == null || (_departDate != null && _arriveDate != null)) {
        _departDate = selectedDay;
        _arriveDate = null;
        _departController.text = DateFormat('dd MMM, yy').format(selectedDay);
      } else {
        if (!selectedDay.isBefore(_departDate!)) {
          _arriveDate = selectedDay;
          _arriveController.text = DateFormat('dd MMM, yy').format(selectedDay);
        }
      }
    });
  }

  @override
  void dispose() {
    _departController.dispose();
    _arriveController.dispose();
    super.dispose();
  }
}
