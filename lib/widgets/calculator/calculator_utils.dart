import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color bgDarkColor = Colors.black;
Color whiteColor = Colors.white;
Color grey1Color = Color(0xFF2E2F38);
Color grey2Color = Color(0xFF4E505F);
Color blueColor = Colors.blue;

void flutterToasting() {
  Fluttertoast.showToast(
    msg: "Invalid input",
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

bool invalidUrl(String userInput, String pressedValue) {
  String lastValue = "";
  var symbols = ['+', "-", "%", "/", "."];
  var symbolsForEmpty = ["+", "-", "%", "/"];
  if (userInput.isNotEmpty) {
    lastValue = userInput[userInput.length - 1];
  }
  if (lastValue.isEmpty) {
    if (symbolsForEmpty.contains(pressedValue)) {
      flutterToasting();
      return true;
    }
    return false;
  } else {
    if (lastValue == "." && pressedValue == ".") {
      flutterToasting();
      return true;
    } else if ((symbols.contains(lastValue)) &&
        symbols.contains(pressedValue)) {
      flutterToasting();
      return true;
    }
    return false;
  }
}

String evaluate(String userInput) {
  try {
    final expression = Expression.parse(userInput);
    final evaluator = const ExpressionEvaluator();
    final r = evaluator.eval(expression, {});
    return r.toStringAsFixed(2);
  } catch (e) {
    return "";
  }
}

bool isItems1(String text) {
  var list1 = ['00', '0', '.', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  return list1.contains(text);
}

bool isItems2(String text) {
  var list2 = ['ac', 'ce', '%'];
  return list2.contains(text);
}

bool isItems3(String text) {
  var list3 = ['/', '*', '-', '+', '='];
  return list3.contains(text);
}

Color? setColor(String text) {
  if (isItems1(text)) {
    return grey1Color;
  } else if (isItems2(text)) {
    return grey2Color;
  } else if (isItems3(text)) {
    return blueColor;
  }
  return null;
}
