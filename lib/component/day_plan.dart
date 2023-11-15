import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:j_planner/component/schedule_bottom_sheet.dart';
import 'package:j_planner/schedule/schedule.dart';

class DayPlan extends StatefulWidget {
  DateTime day;
  List<ScheduleItem> plans;
  DayPlan({
    super.key,
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
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.plans.forEach((element) {
      plans.add(ScheduleItem.clone(element));
    });
  }

  @override
  Widget build(BuildContext context) {
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
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) {
                return ScheduleBottomSheet();
              },
            ).then((value) {
              setState(() {
                plans.add(value);
              });
            });
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
    return returnPlans;
  }
}
