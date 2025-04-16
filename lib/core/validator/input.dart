import 'package:food_app/core/constants/regex.dart';

class InputValidator {
  InputValidator();

  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value.length < 3) {
      return "name too short";
    } else if (value.length > 25) {
      return "name too long";
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (!Regex.matchPhone(value)) {
      return "invalid phone number";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (!Regex.matchEmail(value)) {
      return "invalid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value.length < 6) {
      return "password too short";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value != password) {
      return "password not match";
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "required";
    } else if (value.length < 15) {
      return "address too short";
    }
    return null;
  }
}
