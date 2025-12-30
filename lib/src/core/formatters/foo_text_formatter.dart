


import 'package:flutter/services.dart';
abstract class FooTextFormatterErrorMessages {
  final String invalidValueMessage;

  const FooTextFormatterErrorMessages({
    required this.invalidValueMessage,
  });
}


abstract class FooTextFormatter<Messages extends FooTextFormatterErrorMessages> extends TextInputFormatter {
  
  final Messages messages;
  
  const FooTextFormatter({
    required this.messages,
  });

  List<String> get notValidButCanBeWrittenValues;

  String? validate(String value);

  String? canWrite(String value){
    if (notValidButCanBeWrittenValues.contains(value)) {
      return null;
    }
    return validate(value);
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (canWrite(newValue.text) == null) {
      return newValue;
    }

    if (canWrite(oldValue.text) != null) {
      return newValue;
    }

    return oldValue;
  }
}
