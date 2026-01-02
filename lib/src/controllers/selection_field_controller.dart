import 'package:flutter/material.dart';

import '../../foo_form_field.dart';

/// Abstract base class for selection field controllers.
/// 
/// This class provides the basic functionality for managing a selected value
/// that can be committed to the underlying field value.
abstract class SelectionFieldController<Value> extends ValueFieldController<Value> {
  Value? _selectedValue;

  SelectionFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    required super.areEqual,
  });

  /// The currently selected value (before committing).
  Value? get selectedValue => _selectedValue;

  /// Sets the selected value and notifies listeners.
  set selectedValue(Value? newSelectedValue) {
    excute<void>(
      needToNotifyListener: true,
      toExecute: (FormFieldState<Value> formFieldState) {
        _selectedValue = newSelectedValue;
      },
    );
  }

  /// Commits the current selected value to the field value,
  /// then resets the selected value to null.
  void commit() {
    excute<void>(
      needToNotifyListener: true,
      toExecute: (FormFieldState<Value> formFieldState) {
        value = _selectedValue;
        _selectedValue = null;
      },
    );
  }

  /// Initializes the selection by resetting the selected value to null.
  void initForSelection() {
    excute<void>(
      needToNotifyListener: true,
      toExecute: (FormFieldState<Value> formFieldState) {
        _selectedValue = null;
      },
    );
  }
}

