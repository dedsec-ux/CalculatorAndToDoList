import 'package:flutter/material.dart';

class ToDoListScreen extends StatefulWidget {
  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  final List<String> tasks = [];  // List to store tasks
  final TextEditingController _taskController = TextEditingController();  

  // Method to add a new task
  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        tasks.add(_taskController.text); 
        _taskController.clear();  
      });
    }
  }

  // Method to delete a task
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.purpleAccent],
          ),
        ),
        child: Column(
          children: [
            // Input field to add tasks
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Enter a task',
                        hintStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white24,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addTask,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blueAccent, backgroundColor: Colors.white,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                    child: Icon(Icons.add, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: tasks.isEmpty
                  ? Center(
                      child: Text(
                        'No tasks yet! Add a new task.',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(
                                tasks[index],
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.redAccent),
                                onPressed: () => _deleteTask(index),  
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
