import '../../../foo_form_field.dart';
import '../string_validators.dart';

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

class IntTextFormatter extends NumericTextFormatter<IntTextFormatterErrorMessages>{

  final int? maxValue;
  final bool allowNegative;
  
  IntTextFormatter({
    IntTextFormatterErrorMessages? messages,
    this.allowNegative = false,
    this.maxValue,
  }):super(
    messages: messages ?? IntTextFormatterErrorMessages(),
  );

  @override
  List<String> get notValidButCanBeWrittenValues => [
    if (allowNegative) "-",
  ];

  @override
  String? validate(String value) {
    bool isValidInt = StringValidators.isInteger(
      value: value, 
    );

    if (! isValidInt) {
      return messages.invalidValueMessage;
    }

    int? parsedValue = int.tryParse(value);

    if (parsedValue == null) {
      return messages.invalidValueMessage;
    }

    if (maxValue != null && parsedValue > maxValue!) {
      return messages.greaterThanMaxValueMessage;
    } 

    return null;
  }
}

class IntTextFormatterErrorMessages extends TextFormatterErrorMessages {
  
  final String greaterThanMaxValueMessage;
  final String invalidNegativeMessage;

  IntTextFormatterErrorMessages({
    this.greaterThanMaxValueMessage = "Greater than max value",
    this.invalidNegativeMessage = "Invalid negative number",
    super.invalidValueMessage = "Invalid",
  });
}

class NumTextFormatter extends NumericTextFormatter<NumTextFormatterErrorMessages>{

  final num? maxValue;
  final bool allowNegative;
  
  NumTextFormatter({
    NumTextFormatterErrorMessages? messages,
    this.allowNegative = false,
    this.maxValue,
  }):super(
    messages: messages ?? NumTextFormatterErrorMessages(),
  );

  @override
  List<String> get notValidButCanBeWrittenValues => [
    ".",
    if (allowNegative) "-.",
    if(allowNegative) "-",
  ];

  @override
  String? validate(String value) {
    bool isValidNum = StringValidators.isNumber(
      value: value, 
    );

    if (! isValidNum) {
      return messages.invalidValueMessage;
    }

    num? parsedValue = num.tryParse(value);

    if (parsedValue == null) {
      return messages.invalidValueMessage;
    }

    if (maxValue != null && parsedValue > maxValue!) {
      return messages.greaterThanMaxValueMessage;
    } 

    return null;
  }
}

class NumTextFormatterErrorMessages extends TextFormatterErrorMessages {
  
  final String greaterThanMaxValueMessage;
  final String invalidNegativeMessage;

  NumTextFormatterErrorMessages({
    this.greaterThanMaxValueMessage = "Greater than max value",
    this.invalidNegativeMessage = "Invalid negative number",
    super.invalidValueMessage = "Invalid",
  });
}