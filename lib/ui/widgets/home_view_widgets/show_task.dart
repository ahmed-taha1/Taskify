import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/bottom_sheet/show_bottom_sheet.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/task_tile.dart';

import '../../../data/models/task.dart';

class ShowTask extends StatelessWidget {
  const ShowTask({super.key, required this.task, required this.index});

  final Task task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        horizontalOffset: 300,
        child: FadeInAnimation(
          child: GestureDetector(
            onTap: () async{
              await ShowBottomSheet(context, task);
            },
            child: TaskTile(
              task: task,
            ),
          ),
        ),
      ),
    );
  }
}