String getRaceCode(String input) {
  // Convert the input string to lowercase
  input = input.toLowerCase();

  if (input == 'malay') {
    return '01';
  } else if (input == 'chinese') {
    return '02';
  } else if (input == 'indian') {
    return '03';
  } else {
    return '04';
  }
}
