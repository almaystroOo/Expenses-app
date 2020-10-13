import 'package:intl/intl.dart';

void main() {
  DateTime today = new DateTime.now();
  DateTime fiftyDaysAgo = today.subtract(Duration(days: 1));
  var last = (DateFormat.E().format(fiftyDaysAgo));
  print(last);
}
