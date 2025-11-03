import 'package:flutter/foundation.dart';

class FlutterFieldController<T> extends ChangeNotifier {
  
  T? _value;

  T? get value => _value;

  set value(T? value) {
    _value = value;
    notifyListeners();
  }
  
  void clear(){
    _value = null;
    notifyListeners();
  }
  
}