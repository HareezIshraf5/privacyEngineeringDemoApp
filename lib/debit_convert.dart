String maskString(String input) {
  if (input.length != 16) {
    return "Invalid input";
  }
  String mask = "***********";
  String lastFour = input.substring(12);
  return mask + lastFour;
}
