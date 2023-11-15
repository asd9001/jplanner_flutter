enum ScheduleItemType { time, duration }

class ScheduleItem {
  var duration;
  DateTime time;
  ScheduleItemType type;
  String content;

  ScheduleItem(
    this.duration,
    this.time,
    this.type,
    this.content,
  );

  ScheduleItem.clone(ScheduleItem value)
      : this(
          value.duration,
          value.time,
          value.type,
          value.content,
        );

  @override
  String toString() {
    if (this.type == ScheduleItemType.time) {
      return "time: ${this.time} / content: ${this.content}";
    } else {
      return "duration: ${this.duration} / content: ${this.content}";
    }
  }
}
