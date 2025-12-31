import '../../../foo_form_field.dart';
import '../extentions/comparable_extension.dart';

class RangeValidator{
  final bool allowEqual;
  final String minBiggerThanMaxMessage;
  final String equalMinAndMaxMessage;

  const RangeValidator({
    this.allowEqual = false,
    this.minBiggerThanMaxMessage = "Min value is bigger than max value",
    this.equalMinAndMaxMessage = "Min is equal to max value",
  });

  String? validateMin(Range value) {
    if (value.min == null || value.max == null) {
      return null;
    }

    if (value.min!.isGreaterThan(value.max!)) {
      return minBiggerThanMaxMessage;
    }

    return null;
  }

  String? validateEquality(Range value) {
    if (allowEqual || value.min == null || value.max == null) {
      return null;
    }
    if (value.min!.isEqualTo(value.max!)) {
      return equalMinAndMaxMessage;
    }

    return null;
  }
}