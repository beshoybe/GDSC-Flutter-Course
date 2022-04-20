import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
