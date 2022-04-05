import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Counter App")),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You pressed the button"),
              Text(
                "${counter} Times",
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                      print(counter);
                    });
                  },
                  child: Text("Press"))
            ],
          ),
        ),
      ),
    );
  }
}
