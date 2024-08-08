import 'package:flutter/material.dart';
import 'package:aula_2/home.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
    // home: Scaffold(
    //   body: Center(
    //     child: Text('Hello World', style: TextStyle(fontSize: 24)),
    //   ),
    // ),
    debugShowCheckedModeBanner: false,
  )); //MaterialApp
}
