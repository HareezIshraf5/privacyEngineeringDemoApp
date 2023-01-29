String icmask(String input) {
  if (input.length <= 4) {
    return input;
  } else {
    // Get the first four characters of the input string
    String firstSix = input.substring(0, 6);

    // Replace the rest of the string with asterisks
    String maskedString = firstSix + '*' * (input.length - 6);

    return maskedString;
  }
}
