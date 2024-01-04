import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:j_planner/component/day_plan.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/const/sample_data.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:j_planner/database/drift_database.dart';
import 'package:j_planner/schedule/schedule.dart';

import '../const/words.dart';

class PlansScreen extends StatefulWidget {
  final tripId;

  const PlansScreen({
    super.key,
    required this.tripId,
  });

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  var dates = sample_dates;
  // var plans = sample_data;
  List<Plan>? plans;
  var fetched = false;
  // var tripId = widget.tripId;
  DateTime? startDate;
  DateTime? endDate;

  List<DateTime> calculateDates(DateTime startDate, DateTime endDate) {
    List<DateTime> result = [];
    var days = endDate!.difference(startDate!).inDays;
    for (int i = 0; i <= days; i++) {
      result.add(startDate!.add(Duration(days: i)));
    }
    return result;
  }

  fetchDates() async {
    final selectedDates = await GetIt.I<LocalDatabase>().selectTrip(widget.tripId);
    print("selectedDates : ${selectedDates}");
    if (selectedDates.length != 1) {
      return;
    }
    return selectedDates[0];
  }

  fetchPlans() async {
    print("============ 5.1. Start Fetch Plans ============");
    final selectedDates = await GetIt.I<LocalDatabase>().selectTrip(widget.tripId);
    print("selectedDates : ${selectedDates}");
    if (selectedDates.length != 1) {
      print("============ 5.1. End Fetch Plans ============");
      return;
    }
    final selectedPlans = await GetIt.I<LocalDatabase>().selectPlans(widget.tripId);
    print("selectedPlans : ${selectedPlans}");
    // return selectedPlans;
    setState(() {
      fetched = true;
      startDate = selectedDates[0].tripStartDate;
      endDate = selectedDates[0].tripEndDate;
      dates = calculateDates(startDate!, endDate!);
      plans = selectedPlans;
    });
    print("============ 5.1. End Fetch Plans ============");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPlans();
  }

  @override
  Widget build(BuildContext context) {
    print("============ 5. Plans ============");
    var tripId = widget.tripId;

    print("tripId : ${tripId}");
    print("dates : ${dates}");
    print("plans : ${plans}");

    if (plans == null) {
      // fetchPlans();
      plans = [];
    }
    if (fetched == false) {
      fetchPlans();
    } else {
      fetched = false;
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
                    tripId: tripId,
                    day: e,
                    plans: plans!,
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
