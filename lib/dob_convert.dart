String getBirthday(String input) {
  // Extract the month and date from the input string
  String month = input.substring(2, 4);
  String date = input.substring(4, 6);

  // Convert the month to a string representation
  String monthString = '';
  switch (month) {
    case '01':
      monthString = 'January';
      break;
    case '02':
      monthString = 'February';
      break;
    case '03':
      monthString = 'March';
      break;
    case '04':
      monthString = 'April';
      break;
    case '05':
      monthString = 'May';
      break;
    case '06':
      monthString = 'June';
      break;
    case '07':
      monthString = 'July';
      break;
    case '08':
      monthString = 'August';
      break;
    case '09':
      monthString = 'September';
      break;
    case '10':
      monthString = 'October';
      break;
    case '11':
      monthString = 'November';
      break;
    case '12':
      monthString = 'December';
      break;
  }

  return 'Month: $monthString, Date: $date';
}
