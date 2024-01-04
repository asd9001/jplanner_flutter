import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:j_planner/component/schedule_bottom_sheet.dart';
import 'package:j_planner/database/drift_database.dart';
import 'package:j_planner/schedule/schedule.dart';

class DayPlan extends StatefulWidget {
  int tripId;
  DateTime day;
  List<Plan> plans;
  DayPlan({
    super.key,
    required this.tripId,
    required this.day,
    required this.plans,
  });

  @override
  State<DayPlan> createState() => _DayPlanState();
}

class _DayPlanState extends State<DayPlan> {
  List<ScheduleItem> plans = [];
  var timeFormat = DateFormat("HH:mm");
  var dateFormat = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    print("============ 6. DayPlans =============");

    plans = [];
    widget.plans.forEach((element) {
      if (widget.day != element.planDate) {
        return;
      }
      plans.add(ScheduleItem.clonePlan(element));
    });
    print(" tripId : ${widget.tripId}");
    print(" day : ${widget.day}");
    print(" plans : ${plans}");

    plans = reorderPlans(plans);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
              ),
              dateFormat.format(widget.day),
            ),
          ),
        ),
        ReorderableListView.builder(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return renderReorderableListViewBuilder(index);
          },
          itemCount: plans.length,
          onReorder: reorderFunction,
        ),
        ElevatedButton(
          onPressed: () async {
            Map<String, dynamic> tripArg = new Map();
            tripArg["selectedDate"] = widget.day;
            tripArg["tripId"] = widget.tripId;

            Navigator.of(context).pushNamed(
              "/add_plan",
              arguments: tripArg,
            );
            // showModalBottomSheet(
            //   context: context,
            //   isScrollControlled: true,
            //   builder: (_) {
            //     return ScheduleBottomSheet();
            //   },
            // ).then((value) {
            //   setState(() {
            //     plans.add(value);
            //   });
            // });
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget renderReorderableListViewBuilder(index) {
    var tileColor =
        plans[index % plans.length].type == ScheduleItemType.duration
            ? Colors.blue.withOpacity(0.25)
            : Colors.blue.withOpacity(0.40);
    var trailing = ReorderableDragStartListener(
      key: ValueKey("$index"),
      index: index,
      child: const Icon(Icons.drag_handle),
    );
    return ListTile(
      key: Key("$index"),
      trailing: trailing,
      tileColor: tileColor,
      title: renderListTileTitle(index),
    );
  }

  Widget renderListTileTitle(index) {
    var i = index % plans.length;
    var type = plans[i].type;
    var duration = plans[i].duration;
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text(dateFromat.format(startTime)),
                Text(timeFormat.format(plans[i].time)),
                type == ScheduleItemType.duration
                    ? Text(" ($duration h)")
                    : Text("")
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(plans[i].content),
          ),
        ],
      ),
    );
  }

  void reorderFunction(oldIndex, newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final item = plans.removeAt(oldIndex);
      plans.insert(newIndex, item);
    });
  }

  reorderPlans(List<ScheduleItem> plans) {
    print("============ 6.1. Start ReorderPlans ============");
    if (plans.length == 0) {
      print("============ 6.1. End ReorderPlans (length == 0) ============");
      return plans;
    }
    var startTime = plans[0].time;
    var sumTime = plans[0].time;
    List<ScheduleItem> returnPlans = [
      plans[0],
    ];
    var temp = plans.reduce((v, e) {
      if (e.type == ScheduleItemType.duration) {
        e.time = v.time.add(Duration(hours: e.duration));
      }
      e.time = DateTime(
        widget.day.year,
        widget.day.month,
        widget.day.day,
        e.time.hour,
        e.time.minute,
        e.time.second,
      );
      returnPlans.add(e);
      return e;
    });
    print(" returnPlans : ${returnPlans}");
    print("============ 6.1. End ReorderPlans ============");
    return returnPlans;
  }
}
