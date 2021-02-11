import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void displaySnackBar(BuildContext context, var message) {
  Scaffold.of(context).showSnackBar(
      SnackBar(duration: Duration(seconds: 2), content: Text(message)));
}

String convertUtcTOLocalDate(String date) {
  var dateTime =  DateFormat.yMMMMEEEEd().format(DateTime.parse(date));
  return dateTime.toString();
}
