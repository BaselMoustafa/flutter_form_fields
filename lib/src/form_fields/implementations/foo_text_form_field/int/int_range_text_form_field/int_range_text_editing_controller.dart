import '../../foo_range_text_editing_controller.dart';
import '../int_text_form_field/int_text_editing_controller.dart';
import 'int_range_to_string_range_mapper.dart';

class IntRangeTextEditingController extends FooRangeTextEditingController<int, IntTextEditingController>{
  
  IntRangeTextEditingController({
    required super.minController,
    required super.maxController,
    super.enabled,
    super.forcedErrorText,
  }):super(
    mapper: IntRangeToStringRangeMapper(),
    areEqualValues: (int x, int y) => x == y,
  );
}