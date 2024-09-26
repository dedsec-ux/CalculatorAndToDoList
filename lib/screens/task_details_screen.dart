import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String task = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: Text('Task Details')),
      body: Center(
        child: Text('Details for: $task', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
