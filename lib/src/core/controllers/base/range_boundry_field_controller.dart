part of '../exporter.dart';

/// Concrete range bound controller that uses identical input/output types.
class RangeBoundryFieldController<T>
    extends ConvertableRangeBoundryFieldController<T, T> {
  /// Reuses the convertible base controller while fixing both generics to `T`.
  RangeBoundryFieldController({
    required super.isMin,
    required super.rangeFieldController,
  });
}
