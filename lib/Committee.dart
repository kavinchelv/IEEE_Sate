import 'package:flutter/material.dart';
import 'package:ieee_sate/Auth/auth.dart';
class AppState with ChangeNotifier {
  AppState();

  bool _cV = cV;

  void setPageIndex(cV) {
    _cV = !cV;

    notifyListeners();
  }

  bool get getPageIndex => _cV;
}