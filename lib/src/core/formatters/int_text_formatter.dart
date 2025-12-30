import '../string_validators.dart';
import 'foo_text_formatter.dart';

class IntegerTextFormatter extends FooTextFormatter<IntegerTextFormatterErrorMessages>{

  final int? minValue;
  final int? maxValue;
  final bool allowNegative;
  
  IntegerTextFormatter({
    IntegerTextFormatterErrorMessages? messages,
    this.allowNegative = false,
    this.minValue,
    this.maxValue,
  }):super(
    messages: messages ?? IntegerTextFormatterErrorMessages(),
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

    if(value[0]=="-" && !allowNegative) {
      return messages.invalidNegativeMessage;
    }
    
    int? parsedValue = int.tryParse(value);

    if (parsedValue == null) {
      return messages.invalidValueMessage;
    }

    if (minValue != null && parsedValue < minValue!) {
      return messages.lessThanMinValueMessage;
    }

    if (maxValue != null && parsedValue > maxValue!) {
      return messages.greaterThanMaxValueMessage;
    } 

    return null;
  }
}

class IntegerTextFormatterErrorMessages extends FooTextFormatterErrorMessages {
  
  final String lessThanMinValueMessage;
  final String greaterThanMaxValueMessage;
  final String invalidNegativeMessage;

  IntegerTextFormatterErrorMessages({
    this.lessThanMinValueMessage = "Less than min value",
    this.greaterThanMaxValueMessage = "Greater than max value",
    this.invalidNegativeMessage = "Invalid negative number",
    super.invalidValueMessage = "Invalid",
  });
}