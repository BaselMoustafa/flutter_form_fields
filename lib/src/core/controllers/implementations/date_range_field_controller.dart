part of '../exporter.dart';

/// Controller for single date fields with customizable equality.
class DateFieldController extends ValueFieldController<DateTime> {
  DateFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    bool Function(DateTime x, DateTime y)? areEqual,
  }):super(
    areEqual: areEqual?? (DateTime x, DateTime y) => x.year == y.year && x.month == y.month && x.day == y.day,
  );
}

/// Range bound controller specialized for `DateTime`.
class DateRangeBoundryFieldController extends RangeBoundryFieldController<DateTime> {
  DateRangeBoundryFieldController({
    required super.isMin,
    required super.rangeFieldController,
  });
}

/// Controller for date ranges, wiring min/max bound controllers and equality.
class DateRangeFieldController extends RangeFieldController<DateTime,DateRangeBoundryFieldController> {
  DateRangeFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }):super(
    areEqualValues: (DateTime x, DateTime y) => x.year == y.year && x.month == y.month && x.day == y.day,
    minBoundryControllerBuilder: (rangeFieldController) => DateRangeBoundryFieldController(
      isMin: true,
      rangeFieldController: rangeFieldController,
    ),
    maxBoundryControllerBuilder: (rangeFieldController) => DateRangeBoundryFieldController(
      isMin: false,
      rangeFieldController: rangeFieldController,
    ),
  );
}