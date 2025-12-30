import '../../../../../core/models/mapper.dart';

class IntToStringMapper extends Mapper<int, String> {
  
  IntToStringMapper():super(
    toValue: (String? fieldValue) => int.tryParse(fieldValue ?? ''),
    toFieldValue: (int? value) => value?.toString(),
  );
  
}