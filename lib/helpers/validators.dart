library validtors;

   bool validateName(String value) {
    return value.isNotEmpty;
  }

   bool validateSurname(String value) {
    return value.isNotEmpty;
  }

  bool validateFathername(String value) {
    return value.isNotEmpty;
  }

   bool validateEmail(String value) {
    RegExp regExp = RegExp('\\w+@\\w+\\.\\w+');
    return regExp.hasMatch(value);
  }

   bool validatePassportSeries(String value) {
    RegExp regExp = RegExp('\\d{4}');
    return regExp.hasMatch(value) && value.length == 4;
  }

   bool validatePassportNumber(String value) {
    RegExp regExp = RegExp('\\d{6}');
    return regExp.hasMatch(value) && value.length == 6;
  }

  bool validateInn(String value) {
    RegExp regExp = RegExp('\\d{12}');
    return regExp.hasMatch(value) && value.length == 12;
  }

   bool validateAddress(String value) {
    return value.isNotEmpty;
  }

