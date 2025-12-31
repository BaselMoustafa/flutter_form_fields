import '../../../foo_form_field.dart';

class IntRangeToStringRangeMapper extends Mapper<Range<int>, Range<String>> {

  IntRangeToStringRangeMapper():super(
    toValue: (Range<String>? range){
      if(range == null){
        return null;
      }
      return Range<int>(
        min: int.tryParse(range.min ?? ''),
        max: int.tryParse(range.max ?? ''),
      );
    },
    toFieldValue: (Range<int>? range){
      if(range == null){
        return null;
      }
      return Range<String>(
        min: range.min?.toString(),
        max: range.max?.toString(),
      );
    },
  );
}

class NumRangeToStringRangeMapper extends Mapper<Range<num>, Range<String>> {

  NumRangeToStringRangeMapper():super(
    toValue: (Range<String>? range){
      if(range == null){
        return null;
      }
      return Range<num>(
        min: num.tryParse(range.min ?? ''),
        max: num.tryParse(range.max ?? ''),
      );
    },
    toFieldValue: (Range<num>? range){
      if(range == null){
        return null;
      }
      return Range<String>(
        min: range.min?.toString(),
        max: range.max?.toString(),
      );
    },
  );
}