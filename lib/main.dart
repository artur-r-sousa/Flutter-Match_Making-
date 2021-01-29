import 'package:fake_tinder_second/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'Screens/UserSettings.dart';
import 'Screens/UserPost.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page', debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: Home(),
    );
  }
}
