import 'package:flutter/material.dart';
import 'ui/widget/numberButton.dart';
import 'ui/widget/style/color.dart';
import 'ui/widget/calcMath.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CalcMath calc = CalcMath();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: black,
        body: calculatorApp,
      ),
    );
  }

  Widget get calculatorApp => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: calcScreen,
              flex: 2,
            ),
            Flexible(
              child: calcKeyGrid,
              flex: 5,
            ),
          ],
        ),
      );

  Widget get calcScreen => Container(
        alignment: Alignment.centerRight,
        color: black,
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(calc.resultStep, style: calcScreenStyle),
              Text(calc.resultScreen.toString(), style: calcScreenResultStyle),
            ],
          ),
        ),
      );

  TextStyle calcScreenStyle = TextStyle(color: grey, fontSize: 45);

  TextStyle calcScreenResultStyle = TextStyle(color: blue, fontSize: 35);

  Widget get calcKeyGrid => Container(
        child: Row(
          children: [
            columnGrid(["mc", "c", "7", "4", "1", "%"]),
            columnGrid(["m+", "÷", "8", "5", "2", "0"]),
            columnGrid(["m-", "x", "9", "6", "3", "."]),
            columnGrid(["mr", "Del", "-", "+", "="]),
          ],
        ),
      );

  Widget columnGrid(button) => Expanded(
        child: Column(
          children: List.generate(button.length, (index) {
            int flex = (button[index] == "=") ? 2 : 1;
            return Expanded(
              flex: flex,
              child: InkWell(
                  child: CalcButton(button[index]),
                  onTap: () {
                    setState(() {
                      calc.resultStep = button[index];
                    });
                  }),
            );
          }),
        ),
      );
}
