import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OpenFoodFactsCall {
  static Future<ApiCallResponse> call({
    String? productnum = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'OpenFoodFacts',
      apiUrl:
          'https://world.openfoodfacts.org/api/v0/product/$productnum.json',
      callType: ApiCallType.GET,
      headers: {
        'User-Agent':
            'GreenWay - Android - 0.1 - https://green-way-qjuzj9.flutterflow.app',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? ingredients(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.product.allergens''',
      ));
  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product.image_url''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product.product_name_en''',
      ));
  static String? novascore(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product.nova_groups''',
      ));
  static String? ecograde(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product.ecoscore_grade''',
      ));
  static int? ecoscore(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.product.ecoscore_data.scores.world''',
      ));
  static String? nutriscore(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.product.nutriscore_grade''',
      ));
  static String? altname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.product.product_name''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
