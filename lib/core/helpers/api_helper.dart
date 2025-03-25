import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

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
      log(
        '''
            [APIHelper]: 
              method: ${response.request?.method}
              url: ${response.request?.url}
              headers: ${response.request?.headers}
              statusCode: ${response.statusCode}
              body: ${response.body}
            ''',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (onSuccessMap != null) {
          final utf8Response = utf8.decode(response.bodyBytes);
          final map = jsonDecode(utf8Response) as Map<String, dynamic>;
          if (map['data'] == null) {
            return onSuccessMap(<String, dynamic>{});
          }
          final data = map.keys.contains('user')
              ? map['user'] as Map<String, dynamic>
              : map['data'] as Map<String, dynamic>;
          return onSuccessMap(data);
        } else if (onSuccessList != null) {
          final utf8Response = utf8.decode(response.bodyBytes);
          final list =
              (jsonDecode(utf8Response) as List).cast<Map<String, dynamic>>();
          return onSuccessList(list);
        }
      }

      // Check if error message exists.
      // If error exsists, code will be '06' or else code will be '00'
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (data['error'] != null) {
        log(
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
        if (data['message'] != null) {
          throw APIException(message: data['message'] as String);
        } else {
          throw APIException(
            message: data['An unknown error occurred'] as String,
          );
        }
      }

      log('[APIHelper](request)(body): ${response.body}');
      throw const APIException();
    } on APIException {
      rethrow;
    }
  }
}
