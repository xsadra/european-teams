import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football',
      home: Scaffold(
        appBar: AppBar(
          title: Text('all about clubs'),
        ),
        body: Container(),
      ),
    );
  }
}
