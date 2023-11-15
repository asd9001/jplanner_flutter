import 'package:flutter/material.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/const/words.dart';
import 'package:j_planner/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: TITLE,
    theme: ThemeData(
      primaryColor: PRIMARY_COLOR,
    ),
    home: HomeScreen(),
  ));
}

