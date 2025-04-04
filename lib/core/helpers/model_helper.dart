import 'package:intl/intl.dart';

/// Useful for `toJson`/`fromJson` code generation.
class ModelHelper {
  /// Converts `int` to `double`.
  ///
  /// Returns 0 when `double.tryParse` fails.
  static double intToDouble(int val) => double.tryParse(val.toString()) ?? 0;

  /// Converts `double` to `int`.
  static int doubleToInt(double val) => val.toInt();

  /// Converts `string` to `int`.
  ///
  /// Returns `0` when `double.tryParse` fails.
  static int strToInt(String val) => (double.tryParse(val) ?? 0).toInt();

  /// Converts `string` to `double`.
  ///
  /// Returns `0` when `double.tryParse` fails.
  static double strToDouble(dynamic val) =>
      double.tryParse(val.toString()) ?? 0;

  /// Converts `double` to `string`.
  static String doubleToString(double val) => val.toString();

  /// Converts `string` to `DateTime`.
  ///
  /// Returns `null` when `DateTime.tryParse` fails.
  static DateTime? strToDateTime(String? val) => DateTime.tryParse(val ?? '');

  /// Converts `string` to local `DateTime`.
  ///
  /// Returns `null` when `null` is passed in.
  static DateTime? strToLocalDateTime(String? val) =>
      strToDateTime(val)?.toLocal();

  /// Converts local `DateTime` to UTC ISO 8601 `string`.
  ///
  /// Returns `null` when `null` is passed in.
  static String? localDateTimeToUtcIsoStr(DateTime? val) =>
      val?.toUtc().toIso8601String();

  /// Formats DateTime to `yyyy-MM-dd`.
  ///
  /// e.g. DateTime(1987, 11, 27) -> '1987-11-27'
  /// e.g. DateTime(1990, 03, 08) -> '1990-03-08'
  static String formatDateTime(DateTime? val) =>
      val != null ? DateFormat('yyyy-MM-dd', 'en_US').format(val) : '';
}
