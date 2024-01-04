import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/database/drift_database.dart';
import 'package:j_planner/screen/plans.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateRangeScreen extends StatefulWidget {
  const SelectDateRangeScreen({super.key});

  @override
  State<SelectDateRangeScreen> createState() => _SelectDateRangeScreenState();
}

class _SelectDateRangeScreenState extends State<SelectDateRangeScreen> {
  String _range = '';
  DateTime? startDate;
  DateTime? endDate;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
    setState(() {
      if (args.value is PickerDateRange) {
        startDate = args.value.startDate;
        endDate = args.value.endDate;
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            // ignore: lines_longer_than_80_chars
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(" ============ 4. Select Date Range ============");

    final args = ModalRoute.of(context)!.settings.arguments;
    TripsCompanion? tripsArg;
    if (args != null && args is TripsCompanion) {
      tripsArg = args;
    }
    print(tripsArg);

    return SafeArea(
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Selected range: $_range'),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                showActionButtons: true,
                onCancel: () {
                  Navigator.of(context).pop();
                },
                onSubmit: (Object? value) async {
                  if (value == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'Select Date Range',
                      ),
                      duration: Duration(milliseconds: 1000),
                    ));
                    return;
                  }
                  if (value is PickerDateRange) {
                    if (value!.startDate == null || value!.endDate == null) {
                    } else {
                      var authId = 0;
                      var tripCountry = "";
                      if (tripsArg != null) {
                        authId = tripsArg!.authId.value;
                        tripCountry = tripsArg!.tripCountry.value;
                      } else {
                        authId = 9999;
                        tripCountry = "서울";
                      }
                      final tripId = await GetIt.I<LocalDatabase>().addTrip(
                        TripsCompanion(
                          authId: Value(authId),
                          tripCountry: Value(tripCountry),
                          tripStartDate: Value(value!.startDate!),
                          tripEndDate: Value(value!.endDate!),
                        ),
                      );
                      // Navigator.of(context).pushNamed("/plans", arguments: tripId);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PlansScreen(tripId: tripId)));
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
