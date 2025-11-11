import 'package:foo_form_field/src/core/mappers/base/field_value_mapper.dart';

class IntStringMapper extends FieldValueMapper<int,String> {
  IntStringMapper():super(
    toClientType: (String? text){
      final toReturn = text != null ? int.tryParse(text) : null;
      return toReturn;
    },
    toFieldType: (int? value){
      final toReturn = value?.toString();
      return toReturn;
    },
  );
}