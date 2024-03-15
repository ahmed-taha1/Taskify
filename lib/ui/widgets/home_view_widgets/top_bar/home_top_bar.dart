import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/logic/controllers/task_controller.dart';
import 'package:todo_app/theming/theme.dart';
import 'package:todo_app/ui/widgets/shared/button.dart';

import '../../../pages/add_task_page.dart';

class HomeTopBar extends StatelessWidget {
  HomeTopBar({super.key});

  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle),
              Text('Today', style: headingStyle),
            ],
          ),
          MyButton(
            label: '+ Add Task',
            onTap: () async{
              await Get.to(() => const AddTaskPage());
              _taskController.getTasks();
            },
          ),
        ],
      ),
    );
  }
}
