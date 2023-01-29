String maskPhoneString(String input) {
  // Replace all but the last four characters with asterisks
  String maskedString = '*' * (input.length - 4);

  // Append the last four characters of the input string
  maskedString += input.substring(input.length - 4);

  return maskedString;
}
