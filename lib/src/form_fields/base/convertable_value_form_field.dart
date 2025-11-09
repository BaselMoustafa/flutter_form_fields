import 'package:flutter/material.dart';
import 'package:foo_form_field/foo_form_field.dart';
import 'package:foo_form_field/src/core/widgets/field_with_error_text_widget.dart';

class ConvertableValueFormField<O,I> extends StatefulWidget {

  const ConvertableValueFormField({
    super.key,
    required this.controller,
    required this.fieldBuilder,
    this.layoutBuilder,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.errorBuilder,
    this.restorationId,
    this.onChanged,
  });

  final FooFieldController<O,I> controller;
  final Widget Function(BuildContext context) fieldBuilder;

  final Widget Function(BuildContext context,Widget fieldWidget,String? errorText)? layoutBuilder;
  final void Function(O? value)? onSaved;
  final String? Function(O? value)? validator;
  final AutovalidateMode? autovalidateMode;
  final FormFieldErrorBuilder? errorBuilder;
  final String? restorationId;
  final void Function(O? value)? onChanged;

  @override
  State<ConvertableValueFormField<O,I>> createState() => _ConvertableValueFormFieldState<O,I>();
}

class _ConvertableValueFormFieldState<O,I> extends State<ConvertableValueFormField<O,I>> {

  late final GlobalKey<FormFieldState<I>> _formFieldKey;

  @override
  void initState() {
    super.initState();
    _formFieldKey = GlobalKey<FormFieldState<I>>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.controller.setFormFieldState(_formFieldKey.currentState!);
      widget.controller.addListener(_onEvent);
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onEvent);
    super.dispose();
  }

  void _onEvent(){
    setState(() {});
    if(widget.controller.isValueChanged) {
      widget.onChanged?.call(widget.controller.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<I>(  
      key: _formFieldKey,
      onSaved: (I? value) => widget.onSaved?.call(widget.controller.fromFieldValue(value)),
      validator: (I? value) => widget.validator?.call(widget.controller.fromFieldValue(value)),
      errorBuilder: widget.errorBuilder,
      initialValue: widget.controller.initialValueAsFieldValue,
      enabled: widget.controller.enabled,
      autovalidateMode: widget.autovalidateMode,
      restorationId: widget.restorationId,
      forceErrorText: widget.controller.forcedErrorText,
      builder: (_){
        final errorText = widget.controller.errorText;
        final fieldWidget = widget.fieldBuilder(context);

        if (widget.layoutBuilder!=null) {
          return widget.layoutBuilder!(context,fieldWidget,errorText);
        }

        return FieldWithErrorTextWidget(
          fieldWidget: fieldWidget, 
          errorText: errorText,
        );
      },
    );
  }
}