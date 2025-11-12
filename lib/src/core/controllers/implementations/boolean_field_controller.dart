part of '../exporter.dart';

/// Controller for boolean fields with direct equality comparison.
class BooleanFieldController extends ValueFieldController<bool> {
  BooleanFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }) : super(areEqual: (bool x, bool y) => x == y);
}
