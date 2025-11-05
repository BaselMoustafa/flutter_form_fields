import 'package:foo_form_field/src/core/extentions/string_extension.dart';
import 'package:foo_form_field/src/core/formatters/foo_text_input_formatter.dart';

class IntegerValueInputFormatter extends FooTextInputFormatter {


  final bool allowNegative;
  final int? minValue;
  final int? maxValue;

  final String invalidNegativeMessage;
  final String exceedMinValueMessage;
  final String exceedMaxValueMessage;
  final String invalidIntegerMessage;

  IntegerValueInputFormatter({
    this.allowNegative = false,
    this.minValue,
    this.maxValue,
    this.invalidNegativeMessage = "Invalid negative number",
    this.exceedMinValueMessage = "Exceed min value",
    this.exceedMaxValueMessage = "Exceed max value",
    this.invalidIntegerMessage = "Invalid",
  });

  @override
  String? canWrite(String value) {
    String? validationResult = value.canBeIntText(
      allowNegative: allowNegative,
      invalidNegativeMessage: invalidNegativeMessage,
      invalidIntegerMessage: invalidIntegerMessage,
    );
    
    if (validationResult != null) {
      return validationResult;
    }

    int? parsedValue = int.tryParse(
      value.formatAsIntValue(allowNegative: allowNegative)
    );

    if (parsedValue == null) {
      return invalidIntegerMessage;
    }

    if (minValue != null && parsedValue < minValue!) {
      return exceedMinValueMessage;
    }

    if (maxValue != null && parsedValue > maxValue!) {
      return exceedMaxValueMessage;
    }

    return null;
  }

  @override
  String? validate(String value) {
    final canWriteResult = canWrite(value);
    if (canWriteResult != null) {
      return canWriteResult;
    }

    if (value=="-") {
      return invalidNegativeMessage;
    }

    return null;
  }
  
}