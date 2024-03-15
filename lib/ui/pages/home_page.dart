import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/helpers/spacing.dart';
import 'package:todo_app/logic/controllers/task_controller.dart';
import 'package:todo_app/helpers/size_config.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/top_bar/home_app_bar.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/top_bar/home_top_bar.dart';
import 'package:todo_app/ui/widgets/home_view_widgets/home_tasks.dart';
import '../widgets/home_view_widgets/top_bar/home_date_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();

  final TaskController _taskController = Get.put(TaskController());

  @override
  void initState() {
    super.initState();
    _taskController.getTasks();
  }

  void _updateSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date; // Update selectedDate
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            HomeTopBar(),
            HomeDateBar(onDateSelected: _updateSelectedDate),
            verticalSpace(8),
            HomeTasks(selectedDate: _selectedDate, isCompleted: 0),
            verticalSpace(8),
            _taskController.taskList.isEmpty
                ? const SizedBox()
                : HomeTasks(selectedDate: _selectedDate, isCompleted: 1),
          ],
        ),
      ),
    );
  }
}
