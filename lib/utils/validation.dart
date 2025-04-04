class FormValidation {
  static String? validateFieldNotEmpty(String? value, String? field) =>
      value == null || value.isEmpty ? '$field cannot be empty' : null;

  static String? validateDocumentFieldNotEmpty<T>(String? value) =>
      value == null || value.isEmpty ? 'Select a valid document format' : null;

  static String? validateEmailAddress(String? value) {
    if (value == null) return 'Field cannot be empty';

    if (value.isEmpty) return 'Field cannot be empty';

    final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    return !emailValid ? 'Enter a valid Email Address' : null;
  }

  static String? validateUrlLink(String? value) {
    final urlValid = RegExp(
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)',
    ).hasMatch(value!);

    return !urlValid ? 'Enter a valid link' : null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 4) {
      return 'Password must have minimum of 5 characters';
    }

    if (!RegExp('[A-Z]').hasMatch(value)) {
      return 'Password must contain one uppercase letter';
    }

    if (!RegExp('[a-z]').hasMatch(value)) {
      return 'Password must contain one lower letter';
    }

    if (!RegExp('[0-9]').hasMatch(value)) {
      return 'Password must contain a number';
    }

    if (!RegExp(r'[+=!@#""$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain one special character';
    }

    return null;
  }
}
