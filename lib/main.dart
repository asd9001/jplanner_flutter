import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/const/sample_data.dart';
import 'package:j_planner/const/words.dart';
import 'package:j_planner/database/drift_database.dart';
import 'package:j_planner/screen/home_screen.dart';
import 'package:j_planner/screen/login.dart';
import 'package:get_it/get_it.dart';
import 'package:j_planner/screen/select_trip.dart';
import 'package:j_planner/screen/start_screen.dart';

void initUsers() {}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = LocalDatabase();
  GetIt.I.registerSingleton<LocalDatabase>(database);

  for (var user in sample_users) {
    await database.addUser(UsersCompanion(
        userEmail: Value(user[0]),
        userPw: Value(user[1]),
        userName: Value(user[2])));
  }
  final users = await database.selectUsers();

  runApp(
    MaterialApp(
      initialRoute: '/start',
      routes: {
        '/select': (context) => SelectTripScreen(),
        '/login': (context) => LoginScreen(),
        '/start': (context) => StartScreen(),
        '/plan': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: TITLE,
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
      ),
    ),
  );
}
