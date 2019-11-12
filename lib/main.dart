import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Welcome to birthday",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Welcome to birthday"),
        ),
        body: new Center(
          child: new Text("Hello world"),
        ),
      ),
    );
  }
}