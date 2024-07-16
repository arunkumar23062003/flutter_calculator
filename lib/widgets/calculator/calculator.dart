import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'calculator_buttons.dart';
import 'calculator_display.dart';
import 'calculator_utils.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var result = '';

  void buttonPressed(String text) {
    bool isInvalid = invalidUrl(userInput, text);
    if (!isInvalid) {
      setState(() {
        userInput += text;
      });
    }
  }

  void evaluateExpression() {
    String val = evaluate(userInput);
    if (val.isNotEmpty) {
      setState(() {
        result = val;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 40,
          child: Container(
            color: bgDarkColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(),
                CalculatorDisplay(userInput: userInput, result: result),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 64,
          child: Container(
            color: bgDarkColor,
            child: Column(
              children: [
                getRow(buttonPressed, 'ac', 'ce', '%', '/'),
                SizedBox(height: 20),
                getRow(buttonPressed, '7', '8', '9', '*'),
                SizedBox(height: 20),
                getRow(buttonPressed, '4', '5', '6', '-'),
                SizedBox(height: 20),
                getRow(buttonPressed, '1', '2', '3', '+'),
                SizedBox(height: 20),
                getRow(buttonPressed, '00', '0', '.', '='),
              ],
            ),
          ),
        )
      ],
    );
  }
}
