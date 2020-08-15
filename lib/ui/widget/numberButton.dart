import 'package:calculatorUI/ui/widget/style/color.dart';
import 'package:flutter/material.dart';
import 'calcMath.dart';

// ignore: must_be_immutable
class CalcButton extends StatelessWidget {
  final String number;

  CalcButton(this.number);

  String _numberStep;
  Function onClickAction;
  CalcMath calc = CalcMath();
  @override
  Widget build(BuildContext context) {
    return buttonBox;
  }

  Widget get buttonBox => Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white24, width: 0.1),
            color: colorBg()),
        child: Center(child: number == "Del" ? backspace : numberText),
      );

  Widget get backspace => Icon(Icons.backspace, color: blue);

  Widget get numberText => Text(
        number,
        style: colorText(),
      );

  Color colorBg() {
    if (number == "=") {
      return blue;
    } else if (!validationNumber(number)) {
      return black50;
    } else {
      return black;
    }
  }

  TextStyle colorText() {
    if (number == "=") {
      return textWhite;
    } else if (validationNumber(number)) {
      return textWhite;
    } else if (validationOperatorFeatures(number)) {
      return textGrey;
    } else {
      return textBlue;
    }
  }

  TextStyle textWhite = TextStyle(color: white, fontSize: 38);

  TextStyle textBlue = TextStyle(color: blue, fontSize: 38);

  TextStyle textGrey = TextStyle(color: grey, fontSize: 38);

  bool validationNumber(String value) {
    String pattern = r'^(?=.*?[0-9.%])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validationOperator(String value) {
    String pattern = r'^(?=.*?[+-/x÷cDel])';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool validationOperatorFeatures(String value) {
    String pattern = 'm';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String get numberStep => _numberStep;
}
