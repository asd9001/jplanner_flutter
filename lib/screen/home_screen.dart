import 'package:flutter/material.dart';
import 'package:j_planner/component/day_plan.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/const/sample_data.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';

import '../const/words.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dates = sample_dates;
  var plans = sample_data;

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (startDate == null || endDate == null) {
      return;
    }
    dates = calculateDates(startDate!, endDate!);
  }

  List<DateTime> calculateDates(DateTime startDate, DateTime endDate) {
    List<DateTime> result = [];
    var days = endDate!.difference(startDate!).inDays;
    for (int i = 0; i < days; i++) {
      result.add(startDate!.add(Duration(days: i)));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    if (startDate != null && endDate != null) {
      dates = calculateDates(startDate!, endDate!);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.edit_calendar),
              onPressed: showDateRangePickerDialog,
            ),
          ],
          title: const Text(TITLE),
          backgroundColor: PRIMARY_COLOR,
        ),
        body: ListView(
          children: dates
              .map((e) => DayPlan(
                    day: e,
                    plans: plans,
                  ))
              .toList(),
        ),
        // floatingActionButton: renderFloatingActionButton(),
      ),
    );
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
      onApplyClick: (start, end) {
        setState(() {
          endDate = end;
          startDate = start;
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
