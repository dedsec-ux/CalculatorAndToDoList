import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blueAccent, Colors.purpleAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Title
              Text(
                'Welcome to ToDo & Calculator App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40),
              // ToDo List Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/toDoList');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent, backgroundColor: Colors.white, 
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.list_alt, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text(
                      'ToDo List',
                      style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/calculator');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purpleAccent, backgroundColor: Colors.white, 
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calculate, color: Colors.purpleAccent),
                    SizedBox(width: 10),
                    Text(
                      'Calculator',
                      style: TextStyle(fontSize: 20, color: Colors.purpleAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
