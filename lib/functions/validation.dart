

String? validateInput(String? value) {
  if (value!.isEmpty) {
    return 'Please enter some text';
  } else if (value.length > 25) {
    return 'Text Can\'t Be Larger Than 25';
  } else if (value.length < 2) {
    return 'Text Can\'t Be Less Than 2';
  } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
    return 'Enter invalid name';
  }
  return null;
}

String? validateInputName(String? value) {
  if (value!.isEmpty) {
    return 'Please enter some text';
  } else if (value.length > 25) {
    return 'Text Can\'t Be Larger Than 25';
  } else if (value.length < 2) {
    return 'Text Can\'t Be Less Than 2';
    }
  return null;
}

String? validateInputNumber(String? value) {
  if (value!.isEmpty) {
    return 'Please enter some text';
  } else if (value.length > 12) {
    return 'Text Can\'t Be Larger Than 12';
  } else if (value.isEmpty) {
    return 'Text Can\'t Be Less Than 1';
 
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "This field can't be empty";
  } else if (!value.isValidEmail) {
    return "Please enter valid email";
  }
  return null;
}

String? validatePassword(String? value) {
  List<String> validation = [];
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else {
                      if (!value.isValidPasswordHasNumber) {
                        validation.add("Must contain 1 number");
                      }
                      if (!value.isValidPasswordHasCapitalLetter) {
                        validation.add("Must contain 1 capital letter");
                      }
                      if (!value.isValidPasswordHasLowerCaseLetter) {
                        validation.add("Must contain 1 simple letter");
                      }
                      if (!value.isValidPasswordHasSpecialCharacter) {
                        validation.add(
                            "Must contain 1 special character[! @ # \$ %]");
                      }
                    }
                    String msg = '';
                    if (validation.isNotEmpty) {
                      for (var i = 0; i < validation.length; i++) {
                        msg = msg + validation[i];
                        if ((i + 1) != validation.length) {
                          msg = "$msg\n";
                        }
                      }
                    }
                    return msg.isNotEmpty ? msg : null;
}

// String? validateConfirmPassword(String? value) {
//   if (value == null || value.isEmpty) {
//                       return "This field can't be empty";
//                     } else if (passwordController.text != value) {
//                       return "Confirm password not match";
//                     }
//                     return null;
// }

String? validateWebAddress(String? value) {
  if (value!.isEmpty) {
    return 'Please enter a web address';
  }

  try {
    final Uri uri = Uri.parse(value);
    if (uri.scheme.isEmpty || uri.host.isEmpty) {
      throw const FormatException();
    }
  } on FormatException {
    return 'Please enter a valid web address';
  }

  return null;
}

//=============================== Extension ================================
extension ExtString on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPasswordHasSpecialCharacter {
    final passwordRegExp = RegExp(r'[!@#$\><*~]');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPasswordHasCapitalLetter {
    final passwordRegExp = RegExp(r'[A-Z]');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPasswordHasLowerCaseLetter {
    final passwordRegExp = RegExp(r'[a-z]');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPasswordHasNumber {
    final passwordRegExp = RegExp(r'[0-9]');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
