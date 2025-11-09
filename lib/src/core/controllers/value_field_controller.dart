import 'package:foo_form_field/foo_form_field.dart';

class ValueFieldController<T> extends FooFieldController<T,T> {

  ValueFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    required super.areEqual,
  }): super(
    fromFieldValue: (i) => i,
    toFieldValue: (o) => o,
  );
}