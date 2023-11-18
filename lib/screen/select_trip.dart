import 'package:flutter/material.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/database/drift_database.dart';

class SelectTripScreen extends StatelessWidget {
  const SelectTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print("SelectTripScreen");
    final user = ModalRoute.of(context)!.settings.arguments as User;
    // print(user);
    print(user.userName);
    print(user.userEmail);
    print(user.userId);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          title: Text("Hello ${user.userName}"),
        ),
        backgroundColor: PRIMARY_COLOR,
        body: Center(
          child: Text("Hello"),
        ),
      ),
    );
  }
}
