String formatDate(String? date) {
  if (date == null) return '';

  List<String> splittedDate = date.split('-');
  String year = splittedDate[0];
  String month = splittedDate[1];
  String day = splittedDate[2];

  if (int.parse(month) < 10) {
    month = "0${int.parse(month)}";
  }
 
  if (int.parse(day) < 10) {
    day = "0${int.parse(day)}";
  }

  return "$day/$month/$year";
}

String formatDateToBD(String date) {
  if (date.contains("/")) {
    List<String> splittedDate = date.split('/');

    String day = splittedDate[0];
    String month = splittedDate[1];
    String year = splittedDate[2];

    return "$year-$month-$day";
  }

  return date;
}