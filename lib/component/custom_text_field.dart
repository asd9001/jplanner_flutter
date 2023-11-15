import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final isTimeField;
  final FormFieldSetter<String> onSaved;
  CustomTextField({
    super.key,
    required this.isTimeField,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isTimeField ? Text("Time") : Text("Duration"),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 16.0),
            color: Colors.grey.withOpacity(0.3),
            child: TextFormField(
              onSaved: onSaved,
            ),
          ),
        ),
      ],
    );
  }
}
