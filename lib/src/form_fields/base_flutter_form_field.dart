import 'package:flutter/material.dart';
import 'package:foo_form_field/flutter_form_fields.dart';

abstract class BaseFooFormField<T> extends StatefulWidget {
  final FooFieldController<T>? controller;

  const BaseFooFormField({
    super.key,
    this.controller,
  });

}