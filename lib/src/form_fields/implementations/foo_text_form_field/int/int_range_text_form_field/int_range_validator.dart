import '../../../../../core/models/range.dart';

class IntRangeValidator extends RangeValidator<int> {
  
  IntRangeValidator({
    super.allowEqual = false,
    String? minBiggerThanMaxErrorMessage,
    String? equalMinAndMaxErrorMessage,
  }):super(
    firstIsBiggerThanSecond: (int first, int second) => first > second,
    minBiggerThanMaxMessage: minBiggerThanMaxErrorMessage ?? "Min value is bigger than max value",
    equalMinAndMaxMessage: equalMinAndMaxErrorMessage ?? "Min is equal to max value",
  );

}