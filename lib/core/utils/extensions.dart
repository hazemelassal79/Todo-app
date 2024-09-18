



extension DateTimeExtension on DateTime {


  bool isTheSameDay(DateTime date){
    return year == date.year && month == date.month && day == date.day;
  }
}