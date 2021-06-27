import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String keyValue;
  final Color textColor;
  final Function buttonFunction;
  final Function? longPressFunction;

  CalculatorButton({
    Key? key,
    required this.keyValue,
    required this.textColor,
    required this.buttonFunction,
    this.longPressFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          animationDuration: Duration(milliseconds: 5000),
          backgroundColor: MaterialStateProperty.all(Color(0xFF272B33)),
          // elevation: MaterialStateProperty.all(9.0),
          // shadowColor: MaterialStateProperty.all(textColor),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              // color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: Text(
          keyValue,
          style: TextStyle(
            color: textColor,
          ),
        ),
        onPressed: () {
          buttonFunction();
        },
        onLongPress: () {
          longPressFunction!();
        },
      ),
    );
  }
}
