import 'package:flutter/material.dart';
import 'package:gdsc_test/calc.dart';
import 'package:gdsc_test/counter.dart';
import 'package:gdsc_test/insta.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Calculator());
  }
}
