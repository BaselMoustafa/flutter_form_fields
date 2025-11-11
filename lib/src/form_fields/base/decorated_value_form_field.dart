import 'package:flutter/material.dart';
import 'package:foo_form_field/src/form_fields/base/value_form_field.dart';

class DecoratedValueFormField<T> extends ValueFormField<T> {
  DecoratedValueFormField({
    super.key,
    required super.controller,
    super.onSaved,
    super.validator,
    super.autovalidateMode,
    super.errorBuilder,
    super.restorationId,
    super.onChanged,
    InputDecoration? decoration,
    required Widget Function(BuildContext context) builder,
  }):super(
    builder: (BuildContext context) {
      return InputDecorator(
        decoration: decoration?? InputDecoration(),
        child: builder(context),
      );
    },
  );

}