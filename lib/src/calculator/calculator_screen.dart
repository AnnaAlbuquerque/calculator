import 'package:calculator/src/calculator/calculator_controller.dart';
import 'package:calculator/src/utils/utils_lists.dart';
import 'package:calculator/src/widgets/calculator_button.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorController _calculatorController = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF22252D),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Color(0xFF292D36),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.light_mode_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.dark_mode_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        bottom: 25,
                      ),
                      child: Text(
                        _calculatorController.screenValue,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF292D36),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                keyValue: buttonValues[0],
                                textColor: Color(0xFF279686),
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController.clearLastDigit();
                                  });
                                },
                                longPressFunction: () {
                                  setState(() {
                                    _calculatorController.clearAll();
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[1],
                                textColor: Color(0xFF279686),
                                buttonFunction: () {},
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[2],
                                textColor: Color(0xFF279686),
                                buttonFunction: () {},
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[3],
                                textColor: Color(0xFFAE5356),
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[3]);
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                keyValue: buttonValues[4],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[4]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[5],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[5]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[6],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[6]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[7],
                                textColor: Color(0xFFAE5356),
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[7]);
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                keyValue: buttonValues[8],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[8]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[9],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[9]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[10],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[10]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[11],
                                textColor: Color(0xFFAE5356),
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[11]);
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                keyValue: buttonValues[12],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[12]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[13],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[13]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[14],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[14]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[15],
                                textColor: Color(0xFFAE5356),
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[15]);
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CalculatorButton(
                                keyValue: buttonValues[16],
                                textColor: Colors.white,
                                buttonFunction: () {},
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[17],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[17]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[18],
                                textColor: Colors.white,
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[18]);
                                  });
                                },
                              ),
                              CalculatorButton(
                                keyValue: buttonValues[19],
                                textColor: Color(0xFFAE5356),
                                buttonFunction: () {
                                  setState(() {
                                    _calculatorController
                                        .addToScreenValue(buttonValues[19]);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    // child: StaggeredGridView.countBuilder(
                    //   crossAxisCount: 4,
                    //   itemCount: 20,
                    //   crossAxisSpacing: 20,
                    //   mainAxisSpacing: 20,
                    //   addAutomaticKeepAlives: true,
                    //   padding: EdgeInsets.all(40),
                    //   itemBuilder: (BuildContext context, int index) => Container(
                    //     decoration: BoxDecoration(
                    //       color: Color(0xFF272B33),
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         _calculatorController.buttonValues[index],
                    //         style: TextStyle(
                    //           color: _calculatorController.buttomTextColor(index),
                    //           fontSize: 30,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   staggeredTileBuilder: (int index) =>
                    //       StaggeredTile.count(1, 1),
                    // ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
