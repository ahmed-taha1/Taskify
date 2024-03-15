import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/helpers/size_config.dart';
import 'package:todo_app/helpers/spacing.dart';
import 'package:todo_app/logic/services/notification_services.dart';
import 'package:todo_app/theming/theme.dart';
import 'package:todo_app/ui/pages/home_page.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/show_task.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/task_tile.dart';
import '../../../data/models/task.dart';
import '../../../logic/controllers/task_controller.dart';
import 'no_task_message.dart';

class HomeTasks extends StatefulWidget {
  HomeTasks({super.key, required this.selectedDate, required this.isCompleted});

  final DateTime selectedDate;
  final int isCompleted;

  @override
  State<HomeTasks> createState() => _HomeTasksState();
}

class _HomeTasksState extends State<HomeTasks> {
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (_taskController.taskList.isEmpty) {
          return NoTaskMessage();
        } else {
          return Column(
            children: [
              widget.isCompleted == 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Completed',
                            style: subTitleStyle.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(height: 0),
              widget.isCompleted == 1 ? verticalSpace(8) : verticalSpace(0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // scrollDirection: SizeConfig.orientation == Orientation.portrait
                //     ? Axis.vertical
                //     : Axis.horizontal,
                itemBuilder: (context, index) {
                  var task = _taskController.taskList[index];
                  if (task.isCompleted == widget.isCompleted &&
                      (task.date ==
                              DateFormat.yMd()
                                  .format(widget.selectedDate) ||
                          task.repeat == 'Daily')) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ShowTask(
                        task: task,
                        index: index,
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
                itemCount: _taskController.taskList.length,
              ),
            ],
          );
        }
      },
    );
  }
}
