import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/database/drift_database.dart';

class SelectTripScreen extends StatefulWidget {
  const SelectTripScreen({super.key});

  @override
  State<SelectTripScreen> createState() => _SelectTripScreenState();
}

class _SelectTripScreenState extends State<SelectTripScreen> {
  List<Trip> trips = [];
  String userName = "";
  bool initial = true;
  int userId = 0;
  int tripId = 0;
  int authId = 0;
  String tripCountry = "";
  DateTime? startDate;
  DateTime? endDate;
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments;
    User user;
    if (arg == null) {
      user = User(
          userId: 9999999,
          userEmail: "tester@example.com",
          userPw: "",
          userName: "Tester");
    } else {
      user = arg as User;
    }
    this.userId = user.userId;
    if (initial) {
      getTrips(user.userId);
      initial = false;
    }
    print("build==========");
    print(trips);
    print("build==========");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          title: Text("Hello ${user.userName}"),
        ),
        backgroundColor: PRIMARY_COLOR,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await _displayTextInputDialog(context);
            showDateRangePickerDialog();
          },
        ),
        body: ListView(
            children: trips.map((e) {
          return Card(
            child: ListTile(
              title: Text(e.tripCountry),
              subtitle: Text('${this.startDate} ~ ${this.endDate}'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
              onTap: () {
                print("Push arguments");
                print(e);
                Navigator.of(context).pushNamed('/plans', arguments: e);
              },
            ),
          );
        }).toList()),
      ),
    );
  }

  void getTrips(int userId) async {
    final auths = await GetIt.I<LocalDatabase>().selectAuths(userId);
    // auths
    final authIds = auths.map((e) => e.userId).toList();
    final trips = await GetIt.I<LocalDatabase>().selectTrips(authIds);
    print("getTrips=====");
    print(trips);
    print("getTrips=====");
    this.trips = trips;
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('여행 지역'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "여행 지역 입력"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                addTrip(_textFieldController.text, this.userId);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void addTrip(String tripCountry, int userId) async {
    final authId = await GetIt.I<LocalDatabase>().addAuthOne(userId);
    setState(() {
      this.authId = authId;
      this.tripCountry = tripCountry;
    });
  }

  void showDateRangePickerDialog() {
    showCustomDateRangePicker(
      context,
      dismissible: true,
      minimumDate: DateTime.now().subtract(const Duration(days: 30)),
      maximumDate: DateTime.now().add(const Duration(days: 30)),
      endDate: endDate,
      startDate: startDate,
      backgroundColor: Colors.white,
      primaryColor: Colors.green,
      onApplyClick: (start, end) async {
        print("OnApplyClick===========");
        print(start);
        print(end);
        print(TripsCompanion(
          authId: Value(authId),
          tripCountry: Value(tripCountry),
          tripStartDate: Value(start!),
          tripEndDate: Value(end!),
        ));
        print("OnApplyClick===========");
        final tripId = await GetIt.I<LocalDatabase>().addTrip(
          TripsCompanion(
            authId: Value(authId),
            tripCountry: Value(tripCountry),
            tripStartDate: Value(start!),
            tripEndDate: Value(end!),
          ),
        );
        setState(() {
          this.tripId = tripId;
          endDate = end;
          startDate = start;
          trips.add(Trip(
              id: 0,
              authId: authId,
              tripStartDate: start,
              tripEndDate: end,
              tripCountry: tripCountry));
        });
      },
      onCancelClick: () {
        setState(() {
          endDate = null;
          startDate = null;
        });
      },
    );
  }
}
