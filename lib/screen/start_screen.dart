import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/database/drift_database.dart';

void PrintDb() async {
  var db = GetIt.I<LocalDatabase>();
  var users = await db.selectUsers();
  for (int i = 0; i < users.length; i++) {
    print("==== users ==== ");
    print(users[i]);
    var auths = await db.selectAuths(users[i].userId);
    print("==== auths ==== ");
    print(auths);
    var trips = await db.selectTrips(auths.map<int>((row) => row.authId).toList());
    for (int j = 0 ; j < trips.length; j++) {
      print("==== trips ==== ");
      print(trips[j]);
      print("==== plans ==== ");
      var plans = await db.selectPlans(trips[j].tripId);
      for (int k = 0 ; k < plans.length ; k++) {
        print(plans[k]);
      }
    }
  }
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(" ============ 1. StartScreen ============");
    // PrintDb();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
        ),
        body: Container(
          color: PRIMARY_COLOR,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Center(
                  child: Text(style: TextStyle(fontSize: 50), "J's Planner"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                    // Navigator.of(context).pushNamed('/select_country');
                    // Navigator.of(context).pushNamed('/select_date_range');
                    // Navigator.of(context).pushNamed('/add_plan');
                  },
                  child: Text("Start to plan"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
