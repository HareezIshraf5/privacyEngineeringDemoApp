String checkDisease(String input) {
  // Convert the input string to lowercase
  input = input.toLowerCase();
  if (input == "diabetes" ||
      input == "Diabetes" ||
      input == "Heart attack" ||
      input == "heart attack" ||
      input == "Asthma" ||
      input == "asthma" ||
      input == "cancer" ||
      input == "Cancer") {
    return "Chronic disease found";
  } else if (input == "eczema" || input == "Eczema") {
    return "Non-Chronic disease found";
  } else {
    return "No health history found";
  }
}
