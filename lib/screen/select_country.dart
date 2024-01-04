import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/database/drift_database.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  final myController = TextEditingController(text:"SeoulYDP");

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(" ============ 3. Select Country ============");

    final args = ModalRoute.of(context)!.settings.arguments;
    User? userArg;
    if (args != null && args is User) {
      userArg = args;
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.search),
            SizedBox(width: 10),
            Flexible(
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  hintText: "국가 검색",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                controller: myController,
                onChanged: (text) {},
              ),
            ),
            SizedBox(width: 10),
            // TextButton(onPressed: (){}, child: Text('검색'))
            TextButton(
              onPressed: () async {
                final selectedCountry = myController.text;
                var authId = await GetIt.I<LocalDatabase>().addAuthOne(userArg!.userId);
                var tripsArg = new TripsCompanion(
                  authId: Value(authId),
                  tripCountry: Value(selectedCountry),
                );
                Navigator.of(context).pushNamed(
                  "/select_date_range",
                  arguments: tripsArg,
                );
              },
              child: Text('저장'),
            )
          ],
        ),
      ),
      body: Center(child: Text("Test")),
    ));
  }
}
