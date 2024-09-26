import 'package:flutter/material.dart';

class CalculatorHistoryScreen extends StatelessWidget {
  final List<String> history;

  CalculatorHistoryScreen({required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator History'),
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
        child: history.isEmpty
            ? Center(
                child: Text(
                  'No History Yet!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            history[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.redAccent),
                            onPressed: () {
                              _deleteHistoryItem(context, index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }


  void _deleteHistoryItem(BuildContext context, int index) {
    final snackBar = SnackBar(
      content: Text('Delete option can be implemented here!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
