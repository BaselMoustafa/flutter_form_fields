part of '../exporter.dart';

/// Controller used by `ConvertableRangeFieldController` to manage a single bound (min or max).
///
/// It delegates core configuration to the parent range controller so the bound controller
/// mirrors the range state and reuses its mapper/equality logic.
class ConvertableRangeBoundryFieldController<O, I>
    extends FooFieldController<O, I> {
  /// Creates a bound controller derived from the owning range controller.
  ///
  /// `isMin` selects which side of the range this controller represents.
  /// `rangeFieldController` provides the configuration to mirror and reuse.
  ConvertableRangeBoundryFieldController({
    required bool isMin,
    required ConvertableRangeFieldController<
      O,
      I,
      ConvertableRangeBoundryFieldController<O, I>
    >
    rangeFieldController,
  }) : super(
         forcedErrorText: null,
         areEqual: rangeFieldController.areEqualValues,
         enabled: rangeFieldController.enabled,
         initialValue: isMin
             ? rangeFieldController.value?.min
             : rangeFieldController.value?.max,
         mapper: rangeFieldController.valueMapper,
       );
}
