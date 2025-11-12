part of '../exporter.dart';

/// Specialized range controller where the field and client value types are identical.
class RangeFieldController<T, B extends RangeBoundryFieldController<T>>
    extends ConvertableRangeFieldController<T, T, B> {
  /// Creates a range controller using `SameValueMapper` to avoid type conversions.
  RangeFieldController({
    required super.areEqualValues,
    required super.minBoundryControllerBuilder,
    required super.maxBoundryControllerBuilder,
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }) : super(valueMapper: SameValueMapper<T>());
}
