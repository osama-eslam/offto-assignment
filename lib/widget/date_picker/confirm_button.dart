import 'package:flutter/material.dart';
import 'package:hotel_booking_app/feature/bloc/bloc_DatePicker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmButton extends StatelessWidget {
  final DateTime? departDate;
  final DateTime? arriveDate;

  const ConfirmButton({Key? key, this.departDate, this.arriveDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (departDate != null && arriveDate != null) {
            String departStr = DateFormat('dd MMM, yy').format(departDate!);
            String arriveStr = DateFormat('dd MMM, yy').format(arriveDate!);
            context
                .read<DatePickerCubit>()
                .setDates(departStr as DateTime, arriveStr as DateTime);
            Navigator.pop(context);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).colorScheme.primary
              : Colors.teal,
        ),
        child: const Text("Confirm",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
