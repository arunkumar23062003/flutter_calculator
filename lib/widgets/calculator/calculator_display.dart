import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  final String userInput;
  final String result;
  const CalculatorDisplay(
      {Key? key, required this.userInput, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              userInput,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 40,
                fontFamily: 'WorkSans-L',
              ),
            ),
          ),
        ),
        if (result.isNotEmpty)
          Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                result,
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                  fontFamily: 'WorkSans-L',
                ),
              ),
            ),
          ),
      ],
    );
  }
}
