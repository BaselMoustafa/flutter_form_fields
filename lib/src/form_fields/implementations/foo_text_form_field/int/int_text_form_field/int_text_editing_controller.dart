import '../../foo_text_editing_controller.dart';
import 'int_to_string_mapper.dart';

class IntTextEditingController extends FooTextEditingController<int> {

  IntTextEditingController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }):super(
    mapper: IntToStringMapper()
  );

}