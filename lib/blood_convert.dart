String getBloodTypeCode(String bloodType) {
  switch (bloodType) {
    case 'A':
      return '01';
    case 'B':
      return '02';
    case 'AB':
      return '03';
    case 'O':
      return '04';
    default:
      return 'Cannot be determined';
  }
}
