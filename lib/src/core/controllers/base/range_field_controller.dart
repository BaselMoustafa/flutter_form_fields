import 'package:foo_form_field/src/core/controllers/base/convertable_range_field_controller.dart';
import 'package:foo_form_field/src/core/controllers/base/range_boundry_field_controller.dart';
import 'package:foo_form_field/src/core/mappers/base/same_value_mapper.dart';

class RangeFieldController<T> extends ConvertableRangeFieldController<T,T,RangeBoundryFieldController<T>> {
  RangeFieldController({
    required super.areEqualValues,
    required super.boundaryControllerBuilder,
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }):super(
    valueMapper: SameValueMapper<T>(),
  );
}
