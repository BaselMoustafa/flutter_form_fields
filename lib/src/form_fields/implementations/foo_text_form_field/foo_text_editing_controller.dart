import '../../base/foo_form_field/foo_field_controller.dart';

class FooTextEditingController<Value> extends FooFieldController<Value, String> {
  FooTextEditingController({
    required super.initialValue,
    required super.enabled,
    required super.forcedErrorText,
    required super.mapper,
  }) : super(
    areEqual: (Value x, Value y){
      String? xString = mapper.toFieldValue(x);
      String? yString = mapper.toFieldValue(y);
      return xString == yString;
    },
  );
}