import 'package:flutter/material.dart';
import 'ff/request_manager.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ff/ff_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _symbolStocks = prefs.getString('ff_symbolStocks') ?? _symbolStocks;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _symbolStocks = '';
  String get symbolStocks => _symbolStocks;
  set symbolStocks(String _value) {
    _symbolStocks = _value;
    prefs.setString('ff_symbolStocks', _value);
  }

  dynamic _chatHistory;
  dynamic get chatHistory => _chatHistory;
  set chatHistory(dynamic _value) {
    _chatHistory = _value;
  }

  String _inputContent = '';
  String get inputContent => _inputContent;
  set inputContent(String _value) {
    _inputContent = _value;
  }

  final _newCryptoManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> newCrypto({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _newCryptoManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNewCryptoCache() => _newCryptoManager.clear();
  void clearNewCryptoCacheKey(String? uniqueKey) =>
      _newCryptoManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
