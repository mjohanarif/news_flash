import 'package:intl/intl.dart';

extension StringExtension on String {
  String get convertDateString =>
      DateFormat('dd MMMM yyyy').format(DateTime.parse(this));
}
