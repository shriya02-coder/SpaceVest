import 'dart:convert';
import 'dart:typed_data';

import '../../ff/ff_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OpenAI ChatGPT Group Code

class OpenAIChatGPTGroup {
  static String baseUrl = 'https://api.openai.com/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendFullPromptCall sendFullPromptCall = SendFullPromptCall();
}

class SendFullPromptCall {
  Future<ApiCallResponse> call({
    String? apiKey = '',
    dynamic? promptJson,
  }) {
    final prompt = _serializeJson(promptJson);
    final body = '''
{
  "model": "gpt-3.5-turbo",
  "messages": ${prompt}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Full Prompt',
      apiUrl: '${OpenAIChatGPTGroup.baseUrl}/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        ...OpenAIChatGPTGroup.headers,
        'Authorization': 'Bearer ${apiKey}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic createdTimestamp(dynamic response) => getJsonField(
        response,
        r'''$.created''',
      );
  dynamic role(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.role''',
      );
  dynamic content(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message.content''',
      );
}

/// End OpenAI ChatGPT Group Code

class RapidapiCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'rapidapi',
      apiUrl: 'rapidapi.com',
      callType: ApiCallType.GET,
      headers: {
        'X-Rapidapi-Key': 'bfde805228mshdcfba0eff3e5418p1dc967jsn941a95377e91',
        'X-Rapidapi-Host':
            'esg-environmental-social-governance-data.p.rapidapi.com',
        'Host': 'esg-environmental-social-governance-data.p.rapidapi.com',
      },
      params: {
        'q': "company name or stock symbols or exchange:symbol",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EsgCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'esg',
      apiUrl: 'https://gaialens-esg-scores.p.rapidapi.com/scores',
      callType: ApiCallType.GET,
      headers: {
        'X-RapidAPI-Key': 'bfde805228mshdcfba0eff3e5418p1dc967jsn941a95377e91',
        'X-RapidAPI-Host': 'gaialens-esg-scores.p.rapidapi.com',
      },
      params: {
        'companyname': "Visa Inc.",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StockscallingCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'stockscalling',
      apiUrl: 'https://api.twelvedata.com/stocks',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  static dynamic nameOfCompany(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  static dynamic exchangeOfStock(dynamic response) => getJsonField(
        response,
        r'''$.data[:].exchange''',
        true,
      );
  static dynamic countryofStock(dynamic response) => getJsonField(
        response,
        r'''$.data[:].country''',
        true,
      );
}

class CryptocurrenciesCallingCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'cryptocurrenciesCalling',
      apiUrl: 'https://api.twelvedata.com/cryptocurrencies',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic cryptocompany(dynamic response) => getJsonField(
        response,
        r'''$.data[:].symbol''',
        true,
      );
  static dynamic crptobase(dynamic response) => getJsonField(
        response,
        r'''$.data[:].currency_base''',
        true,
      );
  static dynamic cryptoquote(dynamic response) => getJsonField(
        response,
        r'''$.data[:].currency_quote''',
        true,
      );
}

class CompanyDataCall {
  static Future<ApiCallResponse> call({
    String? symbol = 'AAPL',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'companyData',
      apiUrl: 'https://api.twelvedata.com/profile',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'apikey': "efe36e25a4e24427b401b91113aa4376",
        'symbol': symbol,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic companyName(dynamic response) => getJsonField(
        response,
        r'''$.name''',
        true,
      );
}

class LogoApiStockCall {
  static Future<ApiCallResponse> call({
    String? symbol = 'AAPL',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'logoApiStock',
      apiUrl: 'https://api.twelvedata.com/logo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'apikey': "efe36e25a4e24427b401b91113aa4376",
        'symbol': symbol,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchnameCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'searchname',
      apiUrl: 'https://api.twelvedata.com/time_series?symbol=AAPL',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NftCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'nft',
      apiUrl: 'https://graphql.api.niftory.com',
      callType: ApiCallType.POST,
      headers: {
        'X-Niftory-API-Key': 'ujhdkIyLxVgU64KVTXHFSOEkmsVd8DNu/5nhpVgMyOw=',
        'Authorization': 'Mxg6aulFz4Nb5TLHTqfH2wPHlKz2',
        'Content-type': 'application/graphql',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
