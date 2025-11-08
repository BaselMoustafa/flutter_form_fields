import 'package:flutter/material.dart';
import 'package:foo_form_field/foo_form_field.dart';
import 'package:foo_form_field/src/core/models/range.dart';
import 'package:foo_form_field/src/core/models/range_validator.dart';
import 'package:foo_form_field/src/form_fields/base/convertable_range_form_field.dart';

class IntRangeFormField extends StatelessWidget {
  const IntRangeFormField({
    super.key,
    required this.controller,
    this.minFieldBuilder,
    this.maxFieldBuilder,
    this.rangeValidator,
    this.fieldBuilder,
    this.layoutBuilder,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.errorBuilder,
    this.restorationId,
    this.onChanged,
  });

  final ConvertableRangeFieldController<int,String> controller;
  final Widget Function(BuildContext context,FooFieldController<int,String> minValueController)? minFieldBuilder;
  final Widget Function(BuildContext context,FooFieldController<int,String> maxValueController)? maxFieldBuilder;
  final RangeValidator<int>? rangeValidator;

  final Widget Function(BuildContext context,Widget minField,Widget maxField)? fieldBuilder;
  final Widget Function(BuildContext context,Widget fieldWidget,String? errorText)? layoutBuilder;
  final void Function(Range<int?>? value)? onSaved;
  final String? Function(Range<int?>? value)? validator;
  final AutovalidateMode? autovalidateMode;
  final FormFieldErrorBuilder? errorBuilder;
  final String? restorationId;
  final void Function(Range<int?>? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ConvertableRangeFormField<int,String>(
      controller: controller,
      minFieldBuilder: _minFieldBuilder,
      maxFieldBuilder: _maxFieldBuilder,
      rangeValidator: rangeValidator?? RangeValidator<int>(
        firstIsBiggerThanSecond: (int first, int second) => first > second,
        areEqual: (int first, int second) => first == second,
      ),
    );
  }

  Widget _minFieldBuilder(context, minValueController){
    if (minFieldBuilder!=null) {
      return minFieldBuilder!(context,minValueController);
    }
    return IntValueFormField(controller: minValueController);
  }

  Widget _maxFieldBuilder(BuildContext context,FooFieldController<int,String> maxValueController){
    if (maxFieldBuilder!=null) {
      return maxFieldBuilder!(context,maxValueController);
    }
    return IntValueFormField(controller: maxValueController);
  }
}