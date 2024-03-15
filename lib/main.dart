import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/data/db/db_helper.dart';
import 'package:todo_app/theming/theme.dart';
import 'logic/services/theme_services.dart';
import 'ui/pages/home_page.dart';

// late NotifyHelper notifyHelper;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  // notifyHelper = NotifyHelper();
  // notifyHelper.initializeNotification();
  runApp(const Taskify());
}

class Taskify extends StatelessWidget {
  const Taskify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Taskify',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
