import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String?> getTimeFromUser(BuildContext context,
    {required String initialTime}) async {
  TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: stringToTimeOfDay(initialTime),
  );
  if (pickedTime == null) return null;
  return pickedTime!.format(context);
}

TimeOfDay stringToTimeOfDay(String tod) {
  final format = DateFormat('hh:mm a'); //"6:00 AM"
  return TimeOfDay.fromDateTime(format.parse(tod));
}
