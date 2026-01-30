import 'package:flutter/material.dart';

class DateTextfield extends StatelessWidget {
  const DateTextfield({super.key, required this.dateController});

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFDEE0EF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        controller: dateController,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (pickedDate != null) {
            dateController.text =
                '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
          }
        },
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.calendar_today),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
