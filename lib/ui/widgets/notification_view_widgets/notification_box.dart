import 'package:flutter/material.dart';

import '../../../helpers/spacing.dart';
import '../../../theming/theme.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox({
    super.key, required this.title, required this.description, required this.date,
  });

  final String title;
  final String description;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: primaryClr,
          borderRadius: BorderRadius.circular(30),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.text_format, color: Colors.white, size: 35),
                  horizontalSpacing(20),
                  const Text('Title', style: TextStyle(color: Colors.white, fontSize: 30)),
                ],
              ),
              verticalSpace(20),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 20)),
              verticalSpace(20),
              Row(
                children: [
                  const Icon(Icons.description, color: Colors.white, size: 35),
                  horizontalSpacing(20),
                  const Text('Description', style: TextStyle(color: Colors.white, fontSize: 30)),
                ],
              ),
              verticalSpace(20),
              Text(description, style: const TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.justify),
              verticalSpace(20),
              Row(
                children: [
                  const Icon(Icons.calendar_today_outlined, color: Colors.white, size: 35),
                  horizontalSpacing(20),
                  const Text('Date', style: TextStyle(color: Colors.white, fontSize: 30)),
                ],
              ),
              verticalSpace(20),
              Text(date, style: const TextStyle(color: Colors.white, fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}