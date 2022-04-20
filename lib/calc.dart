import 'dart:math';

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String eqn = '';
  double? num1;
  double? num2;
  double finalNum = 0;
  String? operator;
  bool decimal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Column(
          children: [
            Text(
              eqn,
              style: TextStyle(fontSize: 50, color: Colors.lightBlue),
            ),
            Text(
              finalNum.toString(),
              style: TextStyle(fontSize: 50, color: Colors.lightBlue),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(child: myButton('%')),
            Expanded(child: myButton("^")),
            Expanded(child: myButton('AC')),
            Expanded(child: myButton("Del"))
          ],
        ),
        Row(
          children: [
            Expanded(child: myButton('7')),
            Expanded(child: myButton("8")),
            Expanded(child: myButton('9')),
            Expanded(child: myButton("/"))
          ],
        ),
        Row(
          children: [
            Expanded(child: myButton('4')),
            Expanded(child: myButton("5")),
            Expanded(child: myButton('6')),
            Expanded(child: myButton("x"))
          ],
        ),
        Row(
          children: [
            Expanded(child: myButton('1')),
            Expanded(child: myButton("2")),
            Expanded(child: myButton('3')),
            Expanded(child: myButton("-"))
          ],
        ),
        Row(
          children: [
            Expanded(child: myButton('.')),
            Expanded(child: myButton("0")),
            Expanded(child: myButton('=')),
            Expanded(child: myButton("+"))
          ],
        )
      ]),
    );
  }

  Widget myButton(String text) {
    return Container(
      height: 110,
      padding: EdgeInsets.all(8),
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              if (text == 'Del') {
                finalNum = 0;
                if (eqn.endsWith('.')) {
                  eqn = eqn.substring(0, eqn.length - 1);
                } else {
                  eqn = eqn.substring(0, eqn.length - 1);
                  if (num2 != null) {
                    if (num2! % 1 != 0) {
                      List number = (num2!.toString()).split('.');
                      if (number[1].length == 1) {
                        number[1] = '0';
                      } else {
                        number[1] =
                            number[1].substring(0, number[1].length - 1);
                      }
                      num2 = double.parse(number.join('.'));
                    } else {
                      if (num2! <= 9) {
                        num2 = null;
                      } else {
                        num2 = (num2! ~/ 10).toDouble();
                      }
                    }
                  } else if (operator != null) {
                    operator = null;
                  } else {
                    if (num1! % 1 != 0) {
                      List number = (num1!.toString()).split('.');
                      if (number[1].length == 1) {
                        number[1] = '0';
                      } else {
                        number[1] =
                            number[1].substring(0, number[1].length - 1);
                      }
                      num1 = double.parse(number.join('.'));
                    } else {
                      if (num1! <= 9) {
                        num1 = null;
                      } else {
                        num1 = (num1! ~/ 10).toDouble();
                      }
                    }
                  }
                }
              } else if (text == 'AC') {
                eqn = '';
                num1 = null;
                num2 = null;
                operator = null;
                finalNum = 0;
              } else if (int.tryParse(text) != null) {
                eqn += text;
                if (num1 == null) {
                  num1 = double.parse(text);
                } else if (operator == null) {
                  if (decimal) {
                    List number = (num1!.toString()).split('.');
                    if (number[1] == '0') {
                      num1 = num1! + (double.parse(text) / 10);
                    } else {
                      num1 = num1! +
                          (double.parse(text) / pow(10, number[1].length + 1));
                      // 7.3
                    }
                  } else {
                    num1 = (num1! * 10) + int.parse(text);
                  }
                } else if (num2 == null) {
                  num2 = double.parse(text);
                } else {
                  if (decimal) {
                    List number = (num2!.toString()).split('.');
                    if (number[1] == '0') {
                      num2 = num2! + (double.parse(text) / 10);
                    } else {
                      num2 = num2! +
                          (double.parse(text) / pow(10, number[1].length + 1));
                      // 7.3
                    }
                  } else {
                    num2 = (num2! * 10) + int.parse(text);
                  }
                }
              } else {
                if (text == '.') {
                  decimal = true;
                  eqn += text;
                } else if (text == '=') {
                  if (num1 != null && num2 != null && operator != null) {
                    finalNum = 0;
                    operation(operator!, num1!, num2!);
                  }
                } else {
                  if (num1 != null && num2 != null && operator != null) {
                    finalNum = 0;
                    operation(operator!, num1!, num2!);
                    num1 = finalNum;
                    num2 = null;
                    operator = text;
                    eqn = finalNum.toString() + text;
                  } else {
                    decimal = false;
                    operator = text;
                    eqn += text;
                  }
                }
              }
              print(num1);
              print(num2);
              print(operator);
            });
          },
          child: Text(
            text,
            style: TextStyle(fontSize: 30),
          )),
    );
  }

  void operation(String operator, double num1, double num2) {
    switch (operator) {
      case '+':
        finalNum = finalNum + (num1 + num2);
        break;
      case '-':
        finalNum = finalNum + (num1 - num2);
        break;
      case '/':
        finalNum = finalNum + (num1 / num2);
        break;
      case 'x':
        finalNum = finalNum + (num1 * num2);
        break;
      case '%':
        finalNum = finalNum + (num1 % num2);
        break;
      case '^':
        finalNum = finalNum + (pow(num1, num2));
        break;
      default:
        break;
    }
  }
}
