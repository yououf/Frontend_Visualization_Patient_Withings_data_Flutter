import 'package:flutter/material.dart';

Future<DateTime> datePicker(BuildContext context, DateTime date) async {
  final picked = await showDatePicker(
    context: context,
    locale: const Locale("fr", "FR"),
    initialDate: date,
    firstDate: DateTime(2010, 1),
    lastDate: DateTime(2100),
  );
  if (picked != null) {
    return picked;
  }
  return null;
}
