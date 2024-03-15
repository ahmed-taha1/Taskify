import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/helpers/size_config.dart';
import 'package:todo_app/helpers/spacing.dart';
import 'package:todo_app/theming/theme.dart';

class NoTaskMessage extends StatelessWidget {
  const NoTaskMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: SingleChildScrollView(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              direction: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              children: [
                SizeConfig.orientation == Orientation.landscape
                    ? verticalSpace(6)
                    : verticalSpace(220),
                SvgPicture.asset(
                  'images/task.svg',
                  height: 90,
                  semanticsLabel: 'Task',
                  color: primaryClr.withOpacity(0.6),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Text(
                    'You don not have any tasks yet!\n'
                    'Add new tasks to make your days productive!',
                    style: subTitleStyle.copyWith(color: Get.isDarkMode ? Colors.white : darkGreyClr),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizeConfig.orientation == Orientation.landscape
                    ? verticalSpace(120)
                    : verticalSpace(180),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
