import 'package:intl/intl.dart';

extension DateFormatX on String {
  String get ddMMyyyyHHmm => DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(this));
  String get hhmm => DateFormat('HH:mm').format(DateTime.parse(this));
  String get ddMMMyyyy => DateFormat('dd MMM, yyyy').format(DateTime.parse(this));
  String get ddMMyyyy => DateFormat('dd.MM.yyyy').format(DateTime.parse(this));

  DateTime get ddMMyyyyConvertDate => DateFormat('dd.MM.yyyy').parse(this);
  DateTime get hhmmDate => DateFormat('HH:mm').parse(this);
  DateTime get dateParse => DateTime.parse(this);
  DateTime get hhmmssDate => DateFormat('HH:mm:ss').parse(this);
  DateTime get ddMMyyyyHHmmDate => DateFormat('dd.MM.yyyy HH:mm').parse(this);
  DateTime get ddMMyyyyHHmmssDate => DateFormat('dd.MM.yyyy HH:mm:ss').parse(this);
}
