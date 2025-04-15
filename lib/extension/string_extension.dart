import 'dart:math';

/// String extension methods.
extension StringExtension on String {
  String pluralFormat({String? singular}) {
    if (int.tryParse(this) == 1) {
      return '$this ${singular ?? ''}';
    }
    return '$this ${singular ?? ''}s';
  }

  /// Capitalize first letter.
  String capitalize() {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalize first letter of each word.
  String titleCase() {
    final listParams = toLowerCase().split(' ');
    var result = '';
    for (final value in listParams) {
      if (value != '') {
        result += '${value[0].toUpperCase()}${value.substring(1)} ';
      }
    }
    return result;
  }

  /// Add query parameters to end of string.
  String addQueryParams({required Map<String, Object?> queryParams}) {
    if (queryParams.isEmpty) return this;
    final buffer = StringBuffer('$this?');
    queryParams.forEach((key, value) {
      // Add non-null values to query.
      if (value != null) {
        if (value is List<String>) {
          for (final e in value) {
            buffer.write('$key=$e&');
          }
        } else {
          buffer.write('$key=$value&');
        }
      }
    });

    // Remove last character if '?' or '&'.
    final url = buffer.toString();
    final last = url[url.length - 1];
    if (last == '?' || last == '&') {
      return url.substring(0, url.length - 1);
    }
    return url;
  }

  /// Shuffle the string.
  String shuffleWord() {
    final random = Random();
    final chars = split('')..shuffle(random);
    return chars.join();
  }
}
