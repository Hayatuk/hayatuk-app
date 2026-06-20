import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatDate(BuildContext context, DateTime date) {
  final locale = Localizations.localeOf(context).toString();
  return DateFormat.yMMMd(locale).format(date);
}
