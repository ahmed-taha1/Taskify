import 'package:get/get.dart';
import 'package:todo_app/data/db/db_helper.dart';
import 'package:todo_app/data/models/task.dart';

class TaskController extends GetxController {
  final taskList = <Task>[].obs;

  Future<void> getTasks() async{
    final List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((e) => Task.fromMap(e)).toList());
  }

  Future<int> addTask({required Map<String, dynamic> taskAttr}) async{
    if(taskAttr['title'] == null || taskAttr['title'] == ''){
      return -1;
    }
    Task task = Task.fromMap(taskAttr);
    int id = await DBHelper.insert(task);
    task.id = id;

    taskList.add(task);

    return id;
  }

  Future<int> deleteTask({required int id}) async{
    taskList.removeWhere((element) => element.id == id);
    return await DBHelper.delete(id);
  }

  Future<void> taskCompleted({required int id}) async{
    Task task = taskList[taskList.indexWhere((element) => element.id == id)];
    task.isCompleted = 1;
    await DBHelper.update(task);
    getTasks();
  }

  Future<void> redoTask({required int id}) async{
    Task task = taskList[taskList.indexWhere((element) => element.id == id)];
    task.isCompleted = 0;
    await DBHelper.update(task);
    getTasks();
  }

  Future<void> deleteAllTasks() async{
    taskList.clear();
    await DBHelper.deleteAll();
  }
}