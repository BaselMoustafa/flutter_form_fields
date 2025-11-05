import 'package:flutter/material.dart';

abstract class BaseFooFieldController<T> extends ChangeNotifier {
  

  BaseFooFieldController({
    required bool enabled,
  }): _enabled = enabled;

  bool _enabled;

  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
    notifyListeners();
  }

  bool validate();

  void clear();

  void save();
  
}