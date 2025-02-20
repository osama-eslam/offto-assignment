import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DatePickerCubit extends Cubit<Map<String, DateTime?>> {
  DatePickerCubit() : super({"depart": null, "arrive": null});

  void setDates(DateTime depart, DateTime arrive) {
    emit({"depart": depart, "arrive": arrive});
  }

  String getFormattedDate(BuildContext context, String key) {
    final locale = Localizations.localeOf(context).languageCode;
    final date = state[key];

    if (date == null) return "";

    final dateFormat = DateFormat.yMMMd(locale);
    return dateFormat.format(date);
  }
}
