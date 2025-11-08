import 'package:flutter/material.dart';
///[I] is The type which the form field accepts
///[O] is The type which the client wants to get or set
abstract class FooFieldController<O,I> extends ChangeNotifier {
  
  final O? initialValue;

  I? get initialValueAsFieldValue => toFieldValue(initialValue);
  
  bool _enabled;

  final O? Function(I? i) fromFieldValue;
  
  final I? Function(O? o) toFieldValue;

  FormFieldState<I>? _formFieldState;

  String? _forcedErrorText;

  FooFieldController({
    required bool? enabled,
    required String? forcedErrorText,
    required this.initialValue,
    required this.fromFieldValue,
    required this.toFieldValue,
  }): _enabled = enabled?? true, _forcedErrorText = forcedErrorText;

  void setFormFieldState(FormFieldState<I> formFieldState){
    _formFieldState = formFieldState;
    value = initialValue;
    notifyListeners();
  }

  bool get enabled => _enabled;

  set enabled(bool value) {
    _enabled = value;
    notifyListeners();
  }

  O? get value{
    if (_formFieldState == null) {
      return initialValue;
    }
    return fromFieldValue(_formFieldState!.value);
  }

  set value(O? value){
    return _excuteAfterCheckStateExistence<void>(
      toExecute: (FormFieldState<I> formFieldState) {
        formFieldState.didChange(toFieldValue(value));
        notifyListeners();
      },
    );
  }

  bool validate(){
    return _excuteAfterCheckStateExistence<bool>(
      toExecute: (FormFieldState<I> formFieldState) {
        return formFieldState.validate();
      },
    );
  }

  void clear(){
    return _excuteAfterCheckStateExistence<void>(
      toExecute: (FormFieldState<I> formFieldState) {
        formFieldState.didChange(null);
      },
    );
  }

  void save(){
    return _excuteAfterCheckStateExistence<void>(
      toExecute: (FormFieldState<I> formFieldState) {
        formFieldState.save();
      },
    );
  }

  String? get forcedErrorText{
    return _forcedErrorText;
  }

  set forcedErrorText(String? value){
    _forcedErrorText = value;
    notifyListeners();
  }

  String? get errorText{
    return _excuteAfterCheckStateExistence<String?>(
      toExecute: (FormFieldState<I> formFieldState) {
        return formFieldState.errorText;
      },
    );
  }

  bool get hasError{
    return _excuteAfterCheckStateExistence<bool>(
      toExecute: (FormFieldState<I> formFieldState) {
        return formFieldState.hasError;
      },
    );
  }

  bool get isValid{
    return _excuteAfterCheckStateExistence<bool>(
      toExecute: (FormFieldState<I> formFieldState) {
        return formFieldState.isValid;
      },
    );
  }

  R _excuteAfterCheckStateExistence<R>({
    required R Function(FormFieldState<I> formFieldState) toExecute,
  }) {
    if (_formFieldState == null) {
      throw Exception(
        "This Controller is not attached to a any Foo Form Field",
      );
    }

    R result = toExecute(_formFieldState!);
    notifyListeners();
    return result;
  }
}