import 'package:flutter/material.dart';

import '../../../foo_form_field.dart';
import '../../controllers/foo_text_editing_controllers/string_text_editing_controller.dart';

class StringTextFormField extends StatelessWidget {
  const StringTextFormField({
    super.key, 
    required this.controller, 
    this.properties, 
    this.formatter, 
    this.keyboardType,
  });

  final StringTextEditingController controller;
  final TextFormFieldProperties<String>? properties;
  final StringTextFormatter? formatter;
  final TextInputType? keyboardType;

  factory StringTextFormField.integer({
    required StringTextEditingController controller,
    int? maxLength,
    allowNegative = false,
    TextFormFieldProperties<String>? properties,
  }) {
    return StringTextFormField(
      controller: controller,
      properties: properties,
      keyboardType:TextInputType.numberWithOptions(
        signed: allowNegative,
        decimal: false,
      ),
      formatter: StringTextFormatter(
        maxLength: maxLength, 
        regExpression: RegExp(
          allowNegative ? r'^-?\d+$' : r'^\d+$'
        ),  
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FooTextFormField(
      controller: controller,
      keyboardType: keyboardType,
      properties: properties,
      fooTextFormatters: [
        formatter ?? const StringTextFormatter(),
      ],
    );
  }
}