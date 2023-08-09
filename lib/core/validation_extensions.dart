extension Validator on String {
  bool isNotShortText() {
    return (isNotEmpty && length >= 4);
  }

  bool isValidEmail() {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      caseSensitive: false,
    ).hasMatch(this);
  }

  bool isValidPhone() {
    return RegExp(
      r'^(?:(?:\+|00)(?:963))?(?:0)?9\d{8}$',
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(this);
  }

  bool isValidPassword() {
    return RegExp(
      r'[a-z0-9]{8,}',
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(this);
  }

  bool isValidUrl() {
    return RegExp(
      r"^(((https:\/\/)|(http:\/\/)){1})?(w{3}\.)?([a-z0-9])(.[a-z0-9]{1,})",
      caseSensitive: false,
      multiLine: false,
    ).hasMatch(this);
  }

  isValidFacebook() {
    return RegExp(
          r"^((https:\/\/){1})?(w{3}\.)?(facebook)(.com)\/[0-9a-zA-Z]+\/?",
          caseSensitive: false,
          multiLine: false,
        ).hasMatch(this) ||
        isEmpty;
  }

  isValidInstagram() {
    return RegExp(
          r"^((https:\/\/){1})?(w{3}\.)?(instagram)(.com)\/[0-9a-zA-Z]+\/?",
          caseSensitive: false,
          multiLine: false,
        ).hasMatch(this) ||
        isEmpty;
  }
}
