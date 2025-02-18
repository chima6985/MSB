import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:masoyinbo_mobile/core/core.dart';

/// {@template api_exception}
/// General exception for [APIHelper] methods.
/// {@endtemplate}
class APIException implements Exception {
  /// {@macro api_exception}
  const APIException({String? message})
      : message = message ?? 'Something went wrong';

  /// Error message.
  final String message;

  @override
  String toString() => message;
}

/// General API helper methods.
class APIHelper {
  /// Handles API requests.
  ///
  /// `request` - HTTP request.
  /// `onSuccessMap` - Successful `Map<String,dynamic>` callback.
  /// `onSuccessList` - Successful `List<Map<String, dynamic>>` callback.
  static Future<T> request<T>({
    required Future<http.Response> request,
    T Function(Map<String, dynamic> data)? onSuccessMap,
    T Function(List<Map<String, dynamic>> data)? onSuccessList,
  }) async {
    assert(
      (onSuccessMap != null && onSuccessList == null) ||
          (onSuccessMap == null && onSuccessList != null),
      '`onSuccessMap` OR `onSuccessList` must be defined.',
    );
    try {
      final response = await request;
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (onSuccessMap != null) {
          final utf8Response = utf8.decode(response.bodyBytes);
          final map = jsonDecode(utf8Response) as Map<String, dynamic>;
          if (map['data'] == null) {
            return onSuccessMap(<String, dynamic>{});
          }
          final data = map['data'] as Map<String, dynamic>;
          return onSuccessMap(data);
        } else if (onSuccessList != null) {
          final utf8Response = utf8.decode(response.bodyBytes);
          final map = jsonDecode(utf8Response) as Map<String, dynamic>;
          if (map['data'] == null) {
            return onSuccessList([]);
          }
          final list = (map['data'] as List).cast<Map<String, dynamic>>();
          return onSuccessList(list);
        }
      }

      // Check if error message exists.
      // If error exsists, code will be '06' or else code will be '00'
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['error'] == true) {
        debugPrint(
          '''
            [APIHelper]: 
              method: ${response.request?.method}
              url: ${response.request?.url}
              headers: ${response.request?.headers}
              statusCode: ${response.statusCode}
              message: ${data['msg']}
              body: ${response.body}
            ''',
        );
        if (response.statusCode == 401) {
          if (data['dev_msg'] != null) {
            throw AuthException(message: data['dev_msg'] as String);
          } else {
            throw AuthException(message: data['msg'] as String);
          }
        } else {
          if (data['dev_msg'] != null) {
            throw APIException(message: data['dev_msg'] as String);
          } else {
            throw APIException(message: data['msg'] as String);
          }
        }
      }

      debugPrint('[APIHelper](request)(body): ${response.body}');
      throw const APIException();
    } on APIException {
      rethrow;
    }
  }
}
