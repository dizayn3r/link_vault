import 'package:flutter/material.dart';

class LabelledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;

  const LabelledTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 4.0),
        TextFormField(
          controller: controller,
          enabled: readOnly,
          style: TextStyle(
            color: readOnly
                ? Colors.black
                : Colors.grey, // Change text color based on mode
          ),
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 14.0,
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          validator: (value) => value!.isEmpty ? hintText : null,
        ),
      ],
    );
  }
}
