import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/helpers/spacing.dart';

import '../../theming/theme.dart';
import '../widgets/notification_view_widgets/notification_box.dart';
import '../widgets/notification_view_widgets/notification_top_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);

  final String payload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        centerTitle: true,
        title: Text(_payload.toString().split('|')[0],
            style:
                TextStyle(color: Get.isDarkMode ? Colors.white : darkGreyClr, fontSize: 20)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            NotificationTopText(),
            verticalSpace(10),
            const NotificationBox(
              title: 'payLoad[0]',
              description: 'payLoad[1]',
              date: 'payLoad[2]',
            ),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
