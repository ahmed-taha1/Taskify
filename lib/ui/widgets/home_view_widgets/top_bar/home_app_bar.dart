import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/helpers/spacing.dart';
import 'package:todo_app/theming/theme.dart';

import '../../../../logic/controllers/task_controller.dart';
import '../../../../logic/services/theme_services.dart';

// AppBar customAppBar(BuildContext context,
//     {String? title, IconButton? leading}) {
//   return AppBar(
//     elevation: 0,
//     backgroundColor: Colors.transparent,
//     leading: leading ??
//         IconButton(
//           icon: Icon(Icons.arrow_back_ios, color: primaryClr, size: 24),
//           onPressed: () => Get.back(),
//         ),
//     actions: [
//       const CircleAvatar(
//         backgroundImage: AssetImage('images/person.jpeg'),
//         radius: 20,
//       ),
//       horizontalSpacing(20),
//     ],
//   );
// }

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 24,
          color: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
        onPressed: () {
          ThemeServices().switchTheme();
        },
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.put(TaskController()).deleteAllTasks();
            Get.back();
          },
          icon: Icon(Icons.cleaning_services_outlined,
              size: 24, color: Get.isDarkMode ? Colors.white : darkGreyClr),
        ),
        horizontalSpacing(20),
      ],
    );
  }
}