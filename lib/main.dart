import 'package:flutter/material.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/const/words.dart';
import 'package:j_planner/screen/home_screen.dart';
import 'package:j_planner/screen/start_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/start',
      routes: {
        '/start': (context) => StartScreen(),
        '/plan' : (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: TITLE,
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
      ),
      // home: StartScreen(),
      // home: HomeScreen(),
    ),
  );
}
