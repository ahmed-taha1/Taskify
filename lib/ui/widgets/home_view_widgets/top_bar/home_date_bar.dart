import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/theming/theme.dart';

class HomeDateBar extends StatefulWidget {
  HomeDateBar({Key? key, required this.onDateSelected}) : super(key: key);

  final Function(DateTime) onDateSelected;

  @override
  _HomeDateBarState createState() => _HomeDateBarState();
}

class _HomeDateBarState extends State<HomeDateBar> {
  late DatePickerController _controller;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _controller = DatePickerController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpToSelection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 6),
      child: DatePicker(
        DateTime.now().subtract(const Duration(days: 365)),
        width: 70,
        height: 100,
        initialSelectedDate: selectedDate,
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        onDateChange: (date) {
          widget.onDateSelected(date);
        },
        controller: _controller,
      ),
    );
  }
}