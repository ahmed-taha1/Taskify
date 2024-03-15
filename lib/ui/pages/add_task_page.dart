import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/helpers/spacing.dart';
import 'package:todo_app/theming/theme.dart';
import 'package:todo_app/ui/widgets/add_task_view_widgets/get_date_from_user.dart';
import 'package:todo_app/ui/widgets/add_task_view_widgets/get_time_from_user.dart';
import 'package:todo_app/ui/widgets/shared/button.dart';
import '../../logic/controllers/task_controller.dart';
import '../widgets/add_task_view_widgets/add_task_view_app_bar.dart';
import '../widgets/add_task_view_widgets/colors_selection.dart';
import '../widgets/shared/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  static int selectedColor = 0;

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: const AddTaskViewAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Add Task', style: headingStyle),
              InputField(
                title: 'Title',
                hint: 'Enter title here.',
                controller: _titleController,
              ),
              InputField(
                title: 'Note',
                hint: 'Enter note here.',
                controller: _noteController,
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () async{
                    DateTime? date = await getDateFromUser(context, _selectedDate);
                    if (date != null) {
                      setState(() {
                        _selectedDate = date;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () async{
                          String? time = await getTimeFromUser(context, initialTime: _startTime);
                          if (time != null) {
                            setState(() {
                              _startTime = time;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  horizontalSpacing(12),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () async{
                          String? time = await getTimeFromUser(context, initialTime: _endTime);
                          if (time != null) {
                            setState(() {
                              _endTime = time;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // InputField(
              //   title: 'Remind',
              //   hint: '$_selectedRemind minutes early',
              //   widget: Row(
              //     children: [
              //       DropdownButton(
              //         dropdownColor: Colors.blueGrey,
              //         borderRadius: BorderRadius.circular(10),
              //         items: remindList
              //             .map(
              //               (e) => DropdownMenuItem(
              //                 value: e,
              //                 child: Text(
              //                   '$e',
              //                   style: const TextStyle(color: Colors.white),
              //                 ),
              //               ),
              //             )
              //             .toList(),
              //         icon: const Icon(Icons.keyboard_arrow_down,
              //             color: Colors.grey),
              //         iconSize: 32,
              //         elevation: 4,
              //         style: subTitleStyle,
              //         underline: Container(
              //           height: 0,
              //           color: Colors.white,
              //         ),
              //         onChanged: (value) {
              //           setState(() {
              //             _selectedRemind = value as int;
              //           });
              //         },
              //       ),
              //       horizontalSpacing(6),
              //     ],
              //   ),
              // ),
              InputField(
                title: 'Repeat',
                hint: _selectedRepeat,
                widget: Row(
                  children: [
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: Colors.blueGrey,
                      items: repeatList
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey),
                      iconSize: 32,
                      elevation: 4,
                      style: subTitleStyle,
                      underline: Container(
                        height: 0,
                        color: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedRepeat = value as String;
                        });
                      },
                    ),
                    horizontalSpacing(6),
                  ],
                ),
              ),
              verticalSpace(18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ColorsSelection(),
                  MyButton(
                    label: 'Create Task',
                    onTap: () async {
                      var result = await _taskController.addTask(
                        taskAttr: Map<String, dynamic>.from(
                          {
                            'title': _titleController.text,
                            'note': _noteController.text,
                            'date': DateFormat.yMd().format(_selectedDate),
                            'startTime': _startTime,
                            'endTime': _endTime,
                            'remind': 5,
                            'repeat': _selectedRepeat,  // default value for now, not implemented
                            'color': AddTaskPage.selectedColor,
                            'isCompleted': 0,
                          },
                        ),
                      );
                      if (result == -1) {
                        Get.snackbar(
                          'required',
                          'title is required!',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          icon: const Icon(
                            Icons.warning,
                            color: Colors.white,
                          ),
                        );
                      }
                      else {
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
