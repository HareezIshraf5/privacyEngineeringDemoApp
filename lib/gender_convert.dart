String getGenderCode(String input) {
  // Convert the input string to lowercase
  input = input.toLowerCase();

  if (input == 'male') {
    return '01';
  } else if (input == 'female') {
    return '02';
  } else {
    return '03';
  }
}
