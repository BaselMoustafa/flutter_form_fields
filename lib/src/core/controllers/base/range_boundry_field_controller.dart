import 'package:foo_form_field/foo_form_field.dart';

class RangeBoundryFieldController<T> extends ValueFieldController<T> {
  
  final RangeFieldController<T> rangeFieldController;

  RangeBoundryFieldController({
    required this.rangeFieldController,
  }):super(
    forcedErrorText:null,
    initialValue: rangeFieldController.value?.min,
    enabled: rangeFieldController.enabled,
    areEqual: rangeFieldController.areEqualValues,
  );
}