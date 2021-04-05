import 'package:flutter/material.dart';
import 'package:football/injection_container.dart' as injection;

void main() async {
  await injection.init();
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
