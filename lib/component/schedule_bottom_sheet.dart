import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../const/colors.dart';
import '../schedule/schedule.dart';
import 'custom_text_field.dart';

class ScheduleBottomSheet extends StatefulWidget {
  ScheduleBottomSheet({
    super.key,
  });

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  ScheduleItemType? itemType = ScheduleItemType.duration;
  GlobalKey<FormState> formKey = GlobalKey();
  // var dateFromat = DateFormat("yyyy-MM-dd HH:mm:ss");
  DateTime? time;
  int? duration;
  String? content;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),
          child: Form(
            key: formKey,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  renderRadioButton(),
                  renderTimeField(),
                  renderContentField(),
                  renderSaveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget renderRadioButton() {
    return Row(
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
    );
  }

  Widget renderTimeField() {
    return CustomTextField(
      isTimeField: itemType == ScheduleItemType.time,
      onSaved: (String? val) {
        if (val == null) {
          return;
        }
        if (itemType == ScheduleItemType.time) {
          time = DateTime.parse(val);
        } else {
          duration = int.parse(val);
        }
      },
    );
  }

  Widget renderContentField() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Content"),
            Expanded(
              child: Container(
                color: Colors.grey.withOpacity(0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(border: InputBorder.none),
                        onSaved: (String? val) {
                          if (val == null) {
                            return;
                          }
                          content = val;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderSaveButton() {
    return ElevatedButton(
      onPressed: onSavedPressed,
      child: Text("Save"),
    );
  }

  void onSavedPressed() async {
    if (formKey.currentState == null) {
      return;
    }
    formKey.currentState!.save();
    if (this.content == null) {
      this.content = "nothing";
    }
    print(this.content);
    print(this.time);
    print(this.duration);
    var returnData = ScheduleItem(
      this.duration,
      DateTime.now(),
      ScheduleItemType.duration,
      this.content!,
    );
    Navigator.of(context).pop(returnData);
  }
}
