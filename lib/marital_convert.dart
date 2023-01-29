String maritalStatus(String input) {
  // Convert the input string to lowercase
  input = input.toLowerCase();

  if (input == 'married' || input == 'divorced') {
    return 'Married or Used to';
  } else {
    return 'Not married';
  }
}
