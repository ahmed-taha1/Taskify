
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helpers/spacing.dart';
import '../../../theming/theme.dart';

class NotificationTopText extends StatelessWidget {
  NotificationTopText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Hello, Ahmed",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: Get.isDarkMode ? Colors.white : darkGreyClr),
        ),
        verticalSpace(10),
        Text(
          "You have new reminder",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr),
        ),
      ],
    );
  }
}