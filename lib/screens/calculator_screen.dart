import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = '';
  String result = '0';
  final List<String> history = [];

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        expression = '';
        result = '0';
      } else if (value == '=') {
        _calculateResult();
      } else {
        expression += value;
      }
    });
  }

  void _calculateResult() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      result = eval.toString();
      history.add('$expression = $result');
      expression = '';
    } catch (e) {
      result = 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.pushNamed(context, '/history', arguments: history);
            },
          ),
        ],
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
            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      expression,
                      style: TextStyle(fontSize: 32, color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            Expanded(
              flex: 2,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _onButtonPressed(buttons[index]);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: _getButtonColor(buttons[index]), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5, 
                        padding: EdgeInsets.all(20),
                      ),
                      child: Text(
                        buttons[index],
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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

  final List<String> buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ];

 
  Color _getButtonColor(String buttonText) {
    if (buttonText == '=' || buttonText == 'C') {
      return Colors.redAccent;
    } else if (['/', '*', '-', '+'].contains(buttonText)) {
      return Colors.blueAccent;
    } else {
      return Colors.white24;
    }
  }
}
