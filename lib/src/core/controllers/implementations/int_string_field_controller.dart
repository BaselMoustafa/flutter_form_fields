part of '../exporter.dart';

/// Controller bridging `int` client values with `String` form field values.
class IntStringFieldController extends FooFieldController<int,String> {
  
  IntStringFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }):super(
    areEqual: (int x, int y) => x == y,
    mapper: IntStringMapper(),
  );
}

/// Bound controller for integer ranges backed by string field values.
class IntStringRangeBoundryFieldController extends ConvertableRangeBoundryFieldController<int,String> {
  IntStringRangeBoundryFieldController({
    required super.isMin,
    required super.rangeFieldController,
  });
}

/// Range controller handling integer values stored as strings in the form field.
class IntStringRangeFieldController extends ConvertableRangeFieldController<int,String,IntStringRangeBoundryFieldController> {
  IntStringRangeFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }):super(
    valueMapper: IntStringMapper(),
    areEqualValues: (int x, int y) => x == y,
    minBoundryControllerBuilder: (rangeController) => IntStringRangeBoundryFieldController(
      isMin: true,
      rangeFieldController: rangeController
    ),
    maxBoundryControllerBuilder: (rangeController) => IntStringRangeBoundryFieldController(
      isMin: false,
      rangeFieldController: rangeController
    ),
  );
}