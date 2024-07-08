import 'package:flutter/material.dart';
import 'package:flutter_todo_app/config.dart';
import 'package:flutter_todo_app/configs/app_env.dart';
import 'package:flutter_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:flutter_todo_app/features/todo/view/todo_list_screen.dart';
import 'package:flutter_todo_app/utils/file_loader.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load env file
  Map<String, dynamic> amap = await FileLoader.from(appEnv);
  AppEnv(amap);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.yellow,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const TodoView(),
    );
  }
}
