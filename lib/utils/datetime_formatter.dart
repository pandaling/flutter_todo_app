import 'package:intl/intl.dart';

String? todoDate(DateTime? date) {
  if (date != null && date != DateTime.now()) {
    return DateFormat('d MMM yyyy').format(date);
  }

  return null;
}
