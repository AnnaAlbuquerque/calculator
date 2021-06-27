import 'dart:math';

import 'package:calculator/src/calculator/calculator_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CalculatorController controller = CalculatorController();

  setUp(() {
    controller = CalculatorController(screenValue: "");
  });

  group("Clear all function", () {
    test("Clear an empty string", () {
      controller.clearLastDigit();
      expect(controller.screenValue, "");
    });

    test("Clear a string with lenght > 0", () {
      controller = CalculatorController(screenValue: "1234");
      controller.clearAll();
      expect(controller.screenValue, "");
    });
  });

  group("Clear last digit function", () {
    test("Clear empty string", () {
      controller.clearLastDigit();
      expect(controller.screenValue, "");
    });

    test("Clear string with lenght > 0", () {
      controller = CalculatorController(screenValue: "1234");
      controller.clearLastDigit();
      expect(controller.screenValue, "123");
    });

    test("Clear string with lenght = 1", () {
      controller = CalculatorController(screenValue: "1");
      controller.clearLastDigit();
      expect(controller.screenValue, "");
    });
  });

  group("Add to ScreenValue function", () {
    setUp(() {
      controller = CalculatorController(screenValue: "");
    });

    test("ScreenValue initially is empty", () {
      controller.addToScreenValue("1");
      expect(controller.screenValue, "1");
    });

    test("Parameter is a empty string", () {
      controller.addToScreenValue("");
      expect(controller.screenValue, "");
    });

    test("Parameter is a empty string and screenValue is not empty", () {
      controller.addToScreenValue("1");
      controller.addToScreenValue("");
      expect(controller.screenValue, "1");
    });

    test("Parameter is not a valid value", () {
      controller.addToScreenValue("a");
      expect(controller.screenValue, "");
    });

    test("Parameter is not a valid value and screenValue is not empty", () {
      controller.addToScreenValue("1");
      controller.addToScreenValue("a");
      expect(controller.screenValue, "1");
    });

    test("Add invalid signal for the fisrt position", () {
      controller.addToScreenValue("+");
      expect(controller.screenValue, "");
    });

    test("Add valid signal for the fisrt position", () {
      controller.addToScreenValue("-");
      expect(controller.screenValue, "-");
    });

    test("Invalid signal together", () {
      controller.addToScreenValue("2");
      controller.addToScreenValue("+");
      controller.addToScreenValue("*");
      expect(controller.screenValue, "2*");
    });

    test("Invalid signal together ", () {
      controller.addToScreenValue("1");
      controller.addToScreenValue("*");
      controller.addToScreenValue("-");
      expect(controller.screenValue, "1*-");
    });

    test("Double minus at beggining", () {
      controller.addToScreenValue("-");
      controller.addToScreenValue("-");
      expect(controller.screenValue, "-");
    });

    test("Double minus at middle", () {
      controller.addToScreenValue("3");
      controller.addToScreenValue("-");
      controller.addToScreenValue("-");
      controller.addToScreenValue("-");
      controller.addToScreenValue("4");
      expect(controller.screenValue, "3--4");
    });

    test("Double point in same number ", () {
      controller.addToScreenValue("1");
      controller.addToScreenValue("2");
      controller.addToScreenValue(".");
      controller.addToScreenValue("4");
      controller.addToScreenValue(".");
      controller.addToScreenValue("3");
      expect(controller.screenValue, "12.43");
    });

    test("Double point in same number ", () {
      controller.addToScreenValue("1");
      controller.addToScreenValue("2");
      controller.addToScreenValue(".");
      controller.addToScreenValue("4");
      controller.addToScreenValue(".");
      controller.addToScreenValue("3");
      expect(controller.screenValue, "12.43");
    });

    test("Adds operator after a minus related to signal at begginig", () {
      controller.addToScreenValue("-");
      controller.addToScreenValue("+");
      expect(controller.screenValue, "-");
    });

    test("Adds operator after a minus related to signal at middle", () {
      controller.addToScreenValue("12");
      controller.addToScreenValue("-");
      controller.addToScreenValue("-");
      controller.addToScreenValue("*");
      expect(controller.screenValue, "12--");
    });
  });

  group("Add to list funtion", () {
    group("Only numbers", () {
      test("Positive number", () {
        controller.addToList("123");
        expect(controller.operationsList[0], "123");
      });

      test("Negative number", () {
        controller.addToList("-10");
        expect(controller.operationsList[0], "-10");
      });

      test("Double value", () {
        controller.addToList("1.1");
        expect(controller.operationsList[0], "1.1");
      });
    });

    group("Operation 1 + 1", () {
      setUp(() {
        controller.addToList("1+1");
      });

      test("First position", () {
        expect(controller.operationsList[0], "1");
      });

      test("Second position", () {
        expect(controller.operationsList[1], "+");
      });

      test("Third position", () {
        expect(controller.operationsList[2], "1");
      });
    });

    group("Operation 10 - 1", () {
      setUp(() {
        controller.addToList("10-1");
      });

      test("First position", () {
        expect(controller.operationsList[0], "10");
      });

      test("Second position", () {
        expect(controller.operationsList[1], "-");
      });

      test("Third position", () {
        expect(controller.operationsList[2], "1");
      });
    });

    group("Operation -10 + 1", () {
      setUp(() {
        controller.addToList("-10+1");
      });

      test("First position", () {
        expect(controller.operationsList[0], "-10");
      });

      test("Second position", () {
        expect(controller.operationsList[1], "+");
      });

      test("Third position", () {
        expect(controller.operationsList[2], "1");
      });
    });

    group("Operation 10 + -1", () {
      setUp(() {
        controller.addToList("10+-1");
      });

      test("First position", () {
        expect(controller.operationsList[0], "10");
      });

      test("Second position", () {
        expect(controller.operationsList[1], "+");
      });

      test("Third position", () {
        expect(controller.operationsList[2], "-1");
      });
    });

    group("Operation 1.1 + 1", () {
      setUp(() {
        controller.addToList("1.1+1");
      });

      test("First position", () {
        expect(controller.operationsList[0], "1.1");
      });

      test("Second position", () {
        expect(controller.operationsList[1], "+");
      });

      test("Third position", () {
        expect(controller.operationsList[2], "1");
      });
    });

    group("Operation 1.1 + 2.1", () {
      setUp(() {
        controller.addToList("1.1+2.1");
      });

      test("First position", () {
        expect(controller.operationsList[0], "1.1");
      });

      test("Second position", () {
        expect(controller.operationsList[1], "+");
      });

      test("Third position", () {
        expect(controller.operationsList[2], "2.1");
      });
    });

    group("Operation 1 x 1 x 1", () {
      setUp(() {
        controller.addToList("1*1*1");
      });

      test("First position", () {
        expect(controller.operationsList[0], "1");
      });

      test("Second position", () {
        expect(controller.operationsList[1], "*");
      });

      test("Third position", () {
        expect(controller.operationsList[2], "1");
      });

      test("Fourth position", () {
        expect(controller.operationsList[3], "*");
      });

      test("Fifth position", () {
        expect(controller.operationsList[4], "1");
      });
    });
  });
}
