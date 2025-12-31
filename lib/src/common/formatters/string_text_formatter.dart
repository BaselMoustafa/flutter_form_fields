
import 'foo_text_formatter.dart';

class StringTextFormatter extends FooTextFormatter{
  
  final int? maxLength;
  final RegExp? regExpression;

  const StringTextFormatter({
    StringTextFormatterErrorMessages? messages,
    this.maxLength,
    this.regExpression,
  }):super(
    messages: messages ?? const StringTextFormatterErrorMessages(),
  );

  @override
  String? validate(String value) {
    if (maxLength != null && value.length > maxLength!) {
      return "Max length is $maxLength";
    }

    if (regExpression != null && !regExpression!.hasMatch(value)) {
      return messages.invalidValueMessage;
    }

    return null;
  }
}

class StringTextFormatterErrorMessages extends TextFormatterErrorMessages {
  final String invalidNegativeMessage;
  final String greaterThanMaxDigitsMessage;

  const StringTextFormatterErrorMessages({
    super.invalidValueMessage = "Invalid",
    this.invalidNegativeMessage = "Invalid negative number",
    this.greaterThanMaxDigitsMessage = "Greater than max digits",
  });
}
