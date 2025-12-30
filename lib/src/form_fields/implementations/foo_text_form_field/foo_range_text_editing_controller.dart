import '../../base/convertable_range_form_field/convertable_range_field_controller.dart';
import 'foo_text_editing_controller.dart';

class FooRangeTextEditingController<
  Value,
  BoundryController extends FooTextEditingController<Value>
> extends ConvertableRangeFieldController<Value, String,BoundryController> {

  FooRangeTextEditingController({
    required super.minController,
    required super.maxController,
    required super.areEqualValues,
    required super.mapper,
    super.enabled,
    super.forcedErrorText,
  });
}