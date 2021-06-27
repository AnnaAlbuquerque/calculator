import 'package:calculator/src/utils/utils_lists.dart';
import 'package:flutter/material.dart';

class CalculatorController {
  ///Value shown on the display
  String screenValue;

  List<String> operationsList = [];

  ///Constructor
  CalculatorController({this.screenValue = ""});

  /// Select color according to the index value passed as parameter
  Color buttomTextColor(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
        return Color(0xFF279686);

      case 3:
      case 7:
      case 11:
      case 15:
        return Color(0xFFAE5356);

      default:
        return Colors.white;
    }
  }

  /// Clear the last digit of the string [screenValue]
  void clearLastDigit() {
    if (screenValue.length > 0) {
      screenValue = screenValue.substring(0, screenValue.length - 1);
    }
  }

  /// Clear [screenValue] value completely
  void clearAll() {
    screenValue = "";
  }

  ///Concatenate screenValue with the value passed as parameter
  void addToScreenValue(String value) {
    if (acceptableValues.contains(value)) {
      if (screenValue.length == 0) {
        if (!notFirst.contains(value)) {
          screenValue = screenValue + value;
        }
      } else {
        if (!notFirst.contains(value)) {
          screenValue = screenValue + value;
        } else {
          if (numbers.contains(screenValue[screenValue.length - 1])) {
            screenValue = screenValue + value;
          } else {
            clearLastDigit();
            screenValue = screenValue + value;
          }
        }
      }
    }
  }

  ///Add string to a list, separating it into numbers and signals
  void addToList(String value) {
    for (int i = 0; i < value.length; i++) {
      if (operators.contains(value[i]) || value[i] == "-") {
        operationsList.add(value[i]);
      } else if (value[i] == ".") {
        operationsList[operationsList.length - 1] =
            operationsList[operationsList.length - 1] + value[i];
      } else if (numbers.contains(value[i])) {
        if (operationsList.isEmpty || operators.contains(value[i - 1])) {
          operationsList.add(value[i]);
        } else if (numbers.contains(value[i - 1]) || value[i - 1] == ".") {
          operationsList[operationsList.length - 1] =
              operationsList[operationsList.length - 1] + value[i];
        } else if (value[i - 1] == "-") {
          if (operationsList.length < 2) {
            operationsList[operationsList.length - 1] =
                operationsList[operationsList.length - 1] + value[i];
          } else {
            if (operators.contains(value[i - 2])) {
              operationsList[operationsList.length - 1] =
                  operationsList[operationsList.length - 1] + value[i];
            } else {
              operationsList.add(value[i]);
            }
          }
        }
      }
    }
  }

  /// Transform both string parameters in a double an add them
  double addition(String value1, String value2) {
    return double.parse(value1) + double.parse(value2);
  }

  /// Transform both string parameters in a double an subtract them
  double substration(String value1, String value2) {
    return double.parse(value1) - double.parse(value2);
  }

  /// Transform both string parameters in a double an multiple them
  double multiplication(String value1, String value2) {
    return double.parse(value1) * double.parse(value2);
  }

  /// Transform both string parameters in a double an divide them
  double division(String value1, String value2) {
    return double.parse(value1) / double.parse(value2);
  }

  /// Calculate the result of [operationsList]
  double calculate() {
    double value = 0;

    if (operationsList[operationsList.length - 1] == "." ||
        operators.contains(operationsList[operationsList.length - 1]) ||
        operationsList[operationsList.length - 1] == "-") {
      operationsList.removeLast();
    }
    if (operationsList.length == 1) {
      return double.parse(operationsList[0]);
    } else {
      switch (operationsList[1]) {
        case "+":
          value = addition(operationsList[0], operationsList[2]);
          break;
        case "-":
          value = substration(operationsList[0], operationsList[2]);
          break;
        case "*":
          value = multiplication(operationsList[0], operationsList[2]);
          break;
        case "/":
          if (operationsList[2] == "0") {
            throw Exception();
          }
          value = division(operationsList[0], operationsList[2]);
          break;
      }

      operationsList.removeRange(0, 2);
      operationsList[0] = value.toString();
      return calculate();
    }
  }

  /// Make the calculation of [operationsList] and change screenValue to it
  void equal() {
    addToList(screenValue);
    double value = calculate();
    screenValue = value.toString();
    operationsList = [];
  }
}
