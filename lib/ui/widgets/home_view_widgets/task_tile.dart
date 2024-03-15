import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/helpers/size_config.dart';
import 'package:todo_app/helpers/spacing.dart';
import 'package:todo_app/theming/theme.dart';
import '../../../data/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
            SizeConfig.orientation == Orientation.landscape ? 4 : 20),
      ),
      width: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth / 2
          : SizeConfig.screenWidth,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: task.isCompleted == 1 ? Colors.grey : _getBGClr(task.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title!,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey[200],
                          size: 18,
                        ),
                        horizontalSpacing(12),
                        Text(
                          '${task.startTime!} - ${task.endTime!}',
                          style: GoogleFonts.lato(
                            fontSize: 13,
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(12),
                    Text(
                      task.note!,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        color: Colors.grey[100],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.isCompleted == 0 ? 'TODO' : 'COMPLETED',
                style: titleStyle.copyWith(color: Colors.white, fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getBGClr(int? color) {
    switch (color) {
      case 0:
        return bluishClr;
      case 1:
        return pinkClr;
      case 2:
        return orangeClr;
      default:
        return primaryClr;
    }
  }
}
