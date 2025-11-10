import 'package:foo_form_field/src/core/controllers/base/convertable_range_field_controller.dart';
import 'package:foo_form_field/src/core/controllers/base/convertable_value_field_controller.dart';

class ConvertableRangeBoundryFieldController<O,I> extends ConvertableValueFieldController<O,I> {
  ConvertableRangeBoundryFieldController({
    required ConvertableRangeFieldController<O,I,ConvertableRangeBoundryFieldController<O,I>> rangeFieldController,
  }):super(
    forcedErrorText: null,
    areEqual: rangeFieldController.areEqualValues,
    enabled: rangeFieldController.enabled,
    initialValue: rangeFieldController.value?.min,
    mapper: rangeFieldController.valueMapper,
  );
}