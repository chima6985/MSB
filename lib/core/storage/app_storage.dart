import 'dart:convert';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:masoyinbo_mobile/core/core.dart';

class AppStorage {
  static Box<String>? _box;

  /// Init hive
  static Future<void> init() async {
    await Hive.initFlutter();
    if (!boxInitialized()) {
      _box = await Hive.openBox<String>(boxName);
    }
  }

  /// Check if box is initialized
  static bool boxInitialized() {
    return _box?.isOpen ?? false;
  }

  /// Open hive box
  static Future<void> open() async {
    _box = await Hive.openBox(boxName);
  }

  /// Close hive box
  static Future<void> close() async {
    await Hive.close();
  }

  /// Delete storage
  static Future<void> clear() async {
    await _box?.delete(userKey);
    await _box?.delete(biometricsRequestKey);
  }

  /// Get user from the box
  static User? getUser() {
    try {
      final user = _box?.get(userKey);
      if (user?.isNotEmpty ?? false) {
        final userJson = jsonDecode(user!) as Map<String, dynamic>;
        return User.fromJson(userJson);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  /// Save user
  static void saveUser(User user) {
    try {
      _box?.put(
        userKey,
        jsonEncode(user.toJson()),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  /// Save user email
  static void saveEmail(String email) {
    try {
      _box?.put(emailKey, email);
    } catch (e) {
      log(e.toString());
    }
  }

  /// Get user email
  static String? getEmail() {
    try {
      return _box?.get(emailKey);
    } catch (e) {
      return null;
    }
  }

  /// Save locale
  static void saveLocale(String locale) {
    try {
      _box?.put(localKey, locale);
    } catch (e) {
      log(e.toString());
    }
  }

  /// Get user locale
  static String? getLocale() {
    try {
      return _box?.get(localKey);
    } catch (e) {
      return null;
    }
  }

  /// Disable show biometric request
  static void disableBiometricRequest() {
    try {
      _box?.put(biometricsRequestKey, true.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  /// Get biometrics
  static bool getBiometricRequest() {
    return bool.tryParse(
          _box?.get(biometricsRequestKey) ?? '',
        ) ??
        false;
  }

  /// Get biometrics
  static bool getBiometrics() {
    return bool.tryParse(
          _box?.get(biometricsKey) ?? '',
        ) ??
        false;
  }

  /// Enable biometrics
  static void enableBiometrics() {
    try {
      _box?.put(biometricsKey, true.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  /// DIsable biometrics
  static void disableBiometrics() {
    try {
      _box?.put(biometricsKey, false.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
