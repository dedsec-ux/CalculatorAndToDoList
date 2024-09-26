import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/todo_list_screen.dart';
import 'screens/task_details_screen.dart';
import 'screens/calculator_screen.dart';
import 'screens/calculator_history_screen.dart';

void main() {
  runApp(CombinedApp());
}

class CombinedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo & Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      routes: {
        '/': (context) => HomeScreen(),
        '/toDoList': (context) => ToDoListScreen(),
        '/taskDetails': (context) => TaskDetailsScreen(),
        '/calculator': (context) => CalculatorScreen(),
        '/history': (context) => CalculatorHistoryScreen(history: [],),
      },
      initialRoute: '/', 
    );
  }
}
