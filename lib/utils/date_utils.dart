import 'package:intl/intl.dart' as intl;

String getFullMonthDate(String date) {
  intl.DateFormat formatter = intl.DateFormat('dd MMMM, yyyy');
  try {
    intl.DateFormat dateParse = intl.DateFormat('dd/MM/yyyy');
    return formatter.format(dateParse.parse(date));
  } catch (e) {
    intl.DateFormat dateParse = intl.DateFormat('yyyy-MM-dd');
    return formatter.format(dateParse.parse(date));
  }
}

String getDayWithDate(String date) {
  intl.DateFormat dateParse = intl.DateFormat('dd/MM/yyyy');
  intl.DateFormat formatter = intl.DateFormat('EEE, dd/MM');
  return formatter.format(dateParse.parse(date));
}

DateTime getDayToDate(String date) {
  DateTime now = DateTime.now();
  date = '$date/${now.year}';
  intl.DateFormat formatter = intl.DateFormat('EEE,dd/MM/yyyy');
  return formatter.parse(date);
}

DateTime now = DateTime(2020, 09, 09);
intl.DateFormat formatter = intl.DateFormat('yyyy-MM-dd');
intl.DateFormat formatter1 = intl.DateFormat('dd-MM-yyyy');
intl.DateFormat timeFormat = intl.DateFormat(
  'HH:mm:ss',
); // lowercase hh for 12 hour format and upper case for 24 hour format
