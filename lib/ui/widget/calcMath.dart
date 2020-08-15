import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class CalcMath {
  double _result = 0;
  String step = "";
  String _resultStep = "";
  String operators = "";
  double step2 = 0;
  bool firstNext = false;
  String _resultScreen = "";

  double resultScreenNumber = 0.0;

  set resultStep(String val) {
    _resultScreen = _resultStep += val;
    if (val == ".") {
      step += val;
    } else if (val == "c") {
      _result = 0.0;
      firstNext = false;
      step = "";
      _resultStep = "";
      operators = "";
      step2 = 0;
    } else if (!validationOperator(val)) {
      step += val;
      if (firstNext) {
        _result = calc(step2, operators, number(step));
      }
    } else if (validationOperator(val)) {
      if (firstNext) {
        step2 = _result;
        operators = val;
        step = "";
      } else {
        step2 = number(step);
        operators = val;
        step = "";
        firstNext = true;
      }
    }
  }

  double number(val) => double.parse(val);

  String get resultStep => _resultScreen;
  double get resultScreen => _result;

  double calc(first, operators, second) {
    switch (operators) {
      case "+":
        return add(first, second);
        break;
      case "-":
        return subract(first, second);
        break;
      case "x":
        return multiply(first, second);
        break;
      case "÷":
        return plenty(first, second);
        break;
      case "%":
        return division(first, second);
        break;
      default:
        return 0;
        break;
    }
  }

  double add(double firstVal, double secondVal) => firstVal + secondVal;
  double subract(double firstVal, double secondVal) => firstVal - secondVal;
  double multiply(double firstVal, double secondVal) => firstVal * secondVal;
  double plenty(double firstVal, double secondVal) => firstVal / secondVal;
  double division(double firstVal, double secondVal) => firstVal % secondVal;

  bool validationOperator(String value) {
    String pattern = r'^(?=.*?[+-/x÷])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
