import 'package:j_planner/schedule/schedule.dart';

final zero_date = DateTime.utc(0, 0, 0);
var sample_dates = [
  DateTime.utc(2023, 1, 1),
  DateTime.utc(2023, 1, 2),
  DateTime.utc(2023, 1, 3),
];
var sample_data = [
  ScheduleItem(0, DateTime.utc(0, 0, 0, 1, 0, 0), ScheduleItemType.time, "1"),
  ScheduleItem(2, zero_date, ScheduleItemType.duration, "3"),
  ScheduleItem(3, zero_date, ScheduleItemType.duration, "4"),
  ScheduleItem(0, DateTime.utc(0, 0, 0, 12, 0, 0), ScheduleItemType.time, "1"),
  ScheduleItem(4, zero_date, ScheduleItemType.duration, "5"),
  ScheduleItem(5, zero_date, ScheduleItemType.duration, "6"),
  ScheduleItem(6, zero_date, ScheduleItemType.duration, "7"),
  ScheduleItem(1, zero_date, ScheduleItemType.duration, "2"),
];
