import 'package:intl/intl.dart';

String milisecondsConvetter(int miliseconds) {
  var decisecond = (((miliseconds / 10) / 10)).toStringAsFixed(2);
  var formatDecisecond = decisecond.substring(decisecond.length - 2, decisecond.length);

  var secondsStr = ((miliseconds / 100) % 60).floor().toString().padLeft(2, '0');
  var minutesStr = (((miliseconds / 100) / 60) % 60).floor().toString().padLeft(2, '0');
  return "$minutesStr:$secondsStr:$formatDecisecond";
}

String getFormatDate(DateTime date) {
  var formatter = DateFormat('dd-MM-yyyy');
  String formatted = formatter.format(date);
  return formatted;
}