
import 'package:flutter/material.dart';

import '../../../../../core/formatters/int_text_formatter.dart';
import '../../../../../core/models/foo_form_field_properties.dart';
import '../../../../../core/models/range.dart';
import '../../../../../core/models/text_from_field_properties.dart';
import '../../../../base/convertable_range_form_field/convertable_range_form_field.dart';
import '../int_text_form_field/int_text_form_field.dart';
import 'int_range_text_editing_controller.dart';
import 'int_range_validator.dart';

class IntRangeTextFormField extends StatelessWidget {
  
  const IntRangeTextFormField({
    super.key,
    required this.controller,
    this.rangeValidator,
    this.properties,
    this.minFieldProperties,
    this.maxFieldProperties,
    this.minFieldFormatter,
    this.maxFieldFormatter,
    this.layoutBuilder,
  });

  final IntRangeTextEditingController controller;
  final TextFormFieldProperties<int>? minFieldProperties;
  final TextFormFieldProperties<int>? maxFieldProperties;
  final IntTextFormatter? minFieldFormatter;
  final IntTextFormatter? maxFieldFormatter;
  final FooFormFieldProperties<Range<int>>? properties;
  final IntRangeValidator? rangeValidator;
  final Widget Function(BuildContext context, Widget minField, Widget maxField)? layoutBuilder;

  @override
  Widget build(BuildContext context) {
    return ConvertableRangeFormField(
      controller: controller,
      layoutBuilder: layoutBuilder,
      properties: properties,
      rangeValidator: rangeValidator ?? IntRangeValidator(),
      minFieldBuilder: _minFieldBuilder,
      maxFieldBuilder: _maxFieldBuilder,
    );
  }

  Widget _minFieldBuilder(BuildContext context, String? value) {
    return IntTextFormField(
      controller: controller.minController,
      properties: minFieldProperties,
      formatter: minFieldFormatter,
    );
  }

  Widget _maxFieldBuilder(BuildContext context, String? value) {
    return IntTextFormField(
      controller: controller.maxController,
      properties: maxFieldProperties,
      formatter: maxFieldFormatter,
    );
  }
}
