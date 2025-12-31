
import 'foo_text_formatter.dart';

class StringTextFormatter extends FooTextFormatter<StringTextFormatterErrorMessages>{
  
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
      return messages.exceedsMaxLengthMessage;
    }

    if (regExpression != null && !regExpression!.hasMatch(value)) {
      return messages.invalidValueMessage;
    }

    return null;
  }
}

class StringTextFormatterErrorMessages extends TextFormatterErrorMessages {
  final String exceedsMaxLengthMessage;

  const StringTextFormatterErrorMessages({
    super.invalidValueMessage,
    this.exceedsMaxLengthMessage = "Exceeds max length",
  });
}
