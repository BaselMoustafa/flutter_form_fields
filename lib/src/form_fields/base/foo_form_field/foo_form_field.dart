
import 'package:flutter/material.dart';

import '../../../core/models/foo_form_field_properties.dart';
import 'foo_field_controller.dart';

class FooFormField<Value, FieldValue> extends StatefulWidget {
  const FooFormField({
    super.key,
    required this.controller,
    required this.builder,
    this.properties,
  });

  final FooFieldController<Value, FieldValue> controller;

  final Widget Function(BuildContext context, FieldValue? value) builder;


  final FooFormFieldProperties<Value>? properties;
  

  @override
  State<FooFormField<Value, FieldValue>> createState() => _FooFormFieldState<Value, FieldValue>();
}

class _FooFormFieldState<O, I> extends State<FooFormField<O, I>> {

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

  void _onEvent() {
    setState(() {});
    if (widget.controller.isValueChanged) {
      widget.properties?.onChanged?.call(widget.controller.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<I>(
      key: _formFieldKey,
      onSaved: (I? inputValue) => widget.properties?.onSaved?.call(
        widget.controller.mapper.toValue(inputValue),
      ),
      validator: (I? inputValue) => widget.properties?.validator?.call(
        widget.controller.mapper.toValue(inputValue),
      ),
      errorBuilder: widget.properties?.errorBuilder,
      initialValue: widget.controller.initialValueAsFieldValue,
      enabled: widget.controller.enabled,
      autovalidateMode: widget.properties?.autovalidateMode,
      restorationId: widget.properties?.restorationId,
      forceErrorText: widget.controller.forcedErrorText,
      builder: (FormFieldState<I> fieldState) {
        return widget.builder(context, fieldState.value);
      },
    );
  }
}
