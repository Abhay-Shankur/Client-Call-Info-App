import 'package:intl/intl.dart';

class MyDateUtils {
  // Define a common date format
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  // Method to format a DateTime object into a string
  static String formatDate(DateTime date) {
    return _dateFormat.format(date);
  }

  // Method to parse a string into a DateTime object
  static DateTime parseDate(String dateString) {
    return _dateFormat.parse(dateString);
  }

  // Method to get the difference in days between two dates
  static int getDifferenceInDays(DateTime from, DateTime to) {
    return to.difference(from).inDays;
  }
}
