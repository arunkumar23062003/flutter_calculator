import 'package:flutter/material.dart';
import 'calculator_utils.dart';

Widget getRow(void Function(String) buttonPressed, String charButton1,
    String charButton2, String charButton3, String charButton4) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      buildButton(buttonPressed, charButton1),
      buildButton(buttonPressed, charButton2),
      buildButton(buttonPressed, charButton3),
      buildButton(buttonPressed, charButton4),
    ],
  );
}

Widget buildButton(void Function(String) buttonPressed, String charButton) {
  return TextButton(
    style: TextButton.styleFrom(
      minimumSize: Size(77, 77),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      side: BorderSide(width: 0, color: const Color.fromARGB(0, 193, 17, 17)),
      backgroundColor: setColor(charButton),
    ),
    onPressed: () {
      buttonPressed(charButton);
    },
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        charButton,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: whiteColor,
          fontSize: 32,
        ),
      ),
    ),
  );
}
