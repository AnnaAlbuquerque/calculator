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
  });
}