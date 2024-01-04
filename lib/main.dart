import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/const/sample_data.dart';
import 'package:j_planner/const/words.dart';
import 'package:j_planner/database/drift_database.dart';
import 'package:j_planner/screen/add_plan.dart';
import 'package:j_planner/screen/plans.dart';
import 'package:j_planner/screen/login.dart';
import 'package:get_it/get_it.dart';
import 'package:j_planner/screen/select_country.dart';
import 'package:j_planner/screen/select_date_range.dart';
import 'package:j_planner/screen/select_trip.dart';
import 'package:j_planner/screen/start_screen.dart';


void initUsers() {}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = LocalDatabase();
  GetIt.I.registerSingleton<LocalDatabase>(database);

  await database.clearDb(); // Init first
  for (var user in sample_users) {
    await database.addUser(UsersCompanion(
        userEmail: Value(user[0]),
        userPw: Value(user[1]),
        userName: Value(user[2])));
  }
  final users = await database.selectUsers();
  print(users);

  runApp(
    MaterialApp(
      initialRoute: '/start',
      routes: {
        '/select_trip': (context) => SelectTripScreen(),
        '/select_country': (context) => SelectCountryScreen(),
        '/select_date_range': (context) => SelectDateRangeScreen(),
        '/login': (context) => LoginScreen(),
        '/start': (context) => StartScreen(),
        // '/plans': (context) => PlansScreen(),
        '/add_plan': (context) => PlanAddScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: TITLE,
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
      ),
    ),
  );
}
