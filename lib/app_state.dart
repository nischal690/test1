import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _a = '';
  String get a => _a;
  set a(String value) {
    _a = value;
  }

  String _b = '';
  String get b => _b;
  set b(String value) {
    _b = value;
  }

  String _c = '';
  String get c => _c;
  set c(String value) {
    _c = value;
  }

  String _d = '';
  String get d => _d;
  set d(String value) {
    _d = value;
  }
}
