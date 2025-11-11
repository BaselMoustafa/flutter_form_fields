import 'package:foo_form_field/foo_form_field.dart';

class BooleanFieldController extends ValueFieldController<bool> {
  BooleanFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }):super(
    areEqual: (bool x, bool y) => x == y,
  );
}