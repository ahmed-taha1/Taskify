import 'package:flutter/material.dart';

Future<DateTime?> getDateFromUser(BuildContext context, DateTime selectedDate) async {
  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050));
  return pickedDate;
}
