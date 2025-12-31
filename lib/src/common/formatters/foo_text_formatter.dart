
import 'package:flutter/services.dart';
abstract class TextFormatterErrorMessages {
  final String invalidValueMessage;

  const TextFormatterErrorMessages({
    required this.invalidValueMessage,
  });
}

  
abstract class FooTextFormatter<Messages extends TextFormatterErrorMessages> extends TextInputFormatter {

  final Messages messages;

  const FooTextFormatter({
    required this.messages,
  });
  
  String? validate(String value);

  String? canWrite(String value){
    if(value.isEmpty){
      return null;
    }
    return validate(value);
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {

    if (canWrite(newValue.text) == null) {
      return newValue;
    }

    if (canWrite(oldValue.text) != null) {
      return newValue;
    }

    return oldValue;
  }
}

abstract class NumericTextFormatter<Messages extends TextFormatterErrorMessages> extends FooTextFormatter<Messages> {
  

  const NumericTextFormatter({
    required super.messages,
  });

  List<String> get notValidButCanBeWrittenValues;

  @override
  String? canWrite(String value) {
    if (notValidButCanBeWrittenValues.contains(value)) {
      return null;
    }
    return super.canWrite(value);
  }
}
