import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:j_planner/const/colors.dart';
import 'package:j_planner/database/drift_database.dart';
import 'package:j_planner/schedule/schedule.dart';

double paddingWidth = 10;
List<String> categories = ["이동", "식사", "관광", "휴식"];

class PlanAddScreen extends StatefulWidget {
  const PlanAddScreen({super.key});

  @override
  State<PlanAddScreen> createState() => _PlanAddScreenState();
}

class _PlanAddScreenState extends State<PlanAddScreen> {
  ScheduleItemType? itemType = ScheduleItemType.duration;
  String category = "이동";
  int tripId = 0;

  @override
  Widget build(BuildContext context) {
    // var arg = ModalRoute.of(context)!.settings.arguments;
    // if (arg != null && arg is int) {
    //   tripId = arg;
    // } else {
    //   Navigator.of(context)
    //       .pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
    // }
    DateTime date;
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController(text: "제목예시");
    final timeHourController = TextEditingController(text: "10");
    final timeMinController = TextEditingController(text: "00");
    final durHourController = TextEditingController(text: "1");
    final durMinController = TextEditingController(text: "00");
    final budgetController = TextEditingController(text: "10000");
    final contentController = TextEditingController(text: "내용예시");

    @override
    void dispose() {
      titleController.dispose();
      timeHourController.dispose();
      timeMinController.dispose();
      durHourController.dispose();
      durMinController.dispose();
      budgetController.dispose();
      contentController.dispose();
    }

    var arg = (ModalRoute.of(context)!.settings.arguments ??
        <String, dynamic>{}) as Map;
    if (arg['selectedDate'] != null) {
      date = arg['selectedDate'] as DateTime;
    } else {
      date = DateTime.now();
    }
    if (arg['tripId'] != null) {
      tripId = arg['tripId'] as int;
    } else {
      tripId = 0;
    }
    if (date == null) {
      date = DateTime.now();
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
        ),
        body: Form(
          key: formKey,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("제목"),
                    SizedBox(
                      width: paddingWidth,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: titleController,
                        onChanged: (value) => {},
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Time'),
                        leading: Radio<ScheduleItemType>(
                          value: ScheduleItemType.time,
                          groupValue: itemType,
                          onChanged: (ScheduleItemType? value) {
                            setState(() {
                              itemType = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Duration'),
                        leading: Radio<ScheduleItemType>(
                          value: ScheduleItemType.duration,
                          groupValue: itemType,
                          onChanged: (ScheduleItemType? value) {
                            setState(() {
                              itemType = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ], // radio button
                ),
                (itemType == ScheduleItemType.time
                    ? renderTimePicker(
                        "시각", timeHourController, timeMinController)
                    : renderTimePicker(
                        "시간", durHourController, durMinController)),
                Row(
                  children: [
                    Text("예산"),
                    SizedBox(
                      width: paddingWidth,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: budgetController,
                    )),
                    Text("원"),
                  ],
                ),
                SizedBox(
                  height: paddingWidth,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                    )),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: contentController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // labelText: "Content"
                      ),
                    ),
                  ),
                )),
                // Row(children: [Text("카테고리")]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: categories.map((e) => renderCategory(e)).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: paddingWidth,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Cancel")),
                    ),
                    SizedBox(
                      width: paddingWidth,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            DateTime timeDate = DateTime(0,0,0,0,0,0,);
                            int durDate = 0;
                            if (itemType == ScheduleItemType.time) {
                              timeDate = DateTime(
                                date.year,
                                date.month,
                                date.day,
                                int.parse(timeHourController.text),
                                int.parse(timeMinController.text),
                              );
                            } else {
                              durDate = int.parse(durHourController.text) * 60 + int.parse(durMinController.text);
                            }
                            var plan = PlansCompanion(
                              tripId: Value(tripId),
                              planDate: Value(date),
                              planCategory: Value(getCategoryNumber(category)),
                              planContent: Value(contentController.text),
                              planSubject: Value(titleController.text),
                              planWallet:
                                  Value(int.parse(budgetController.text)),
                              planType: Value(itemType!.index),
                              planTime: Value(timeDate!),
                              planDuration: Value(durDate),
                              planOrder: Value(9999),
                            );
                            print(plan);
                            await GetIt.I<LocalDatabase>().addPlan(plan);
                            var plans = await GetIt.I<LocalDatabase>().selectPlans(1);
                            print(plans);
                            Navigator.of(context).pop();
                          },
                          child: Text("Save")),
                    ),
                    SizedBox(
                      width: paddingWidth,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  int getCategoryNumber(String category) {
    for (int i = 0 ; i < categories.length ; i++) {
      if (categories[i] == category) {
        return i;
      }
    }
    return 0;
  }
  Widget renderCategory(String title) {
    var defaultColor = Colors.black;
    if (this.category == title) {
      defaultColor = Colors.blue;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: OutlinedButton(
        style: ButtonStyle(
            side: MaterialStateProperty.all(BorderSide(
                color: defaultColor, width: 1.0, style: BorderStyle.solid))),
        onPressed: () {
          setState(() {
            this.category = title;
          });
        },
        child: Text(title),
      ),
    );
  }

  Widget renderTimePicker(
      String title, TextEditingController hour, TextEditingController min) {
    return Row(
      children: [
        Text(title),
        SizedBox(width: paddingWidth),
        Expanded(child: TextFormField(controller: hour)),
        SizedBox(width: paddingWidth),
        Text("시"),
        SizedBox(width: paddingWidth),
        Expanded(child: TextFormField(controller: min)),
        SizedBox(width: paddingWidth),
        Text("분"),
      ],
    );
  }
}
