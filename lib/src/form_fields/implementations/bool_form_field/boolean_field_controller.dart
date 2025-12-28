part of '../../../core/controllers/exporter.dart';

/// Controller for boolean fields with direct equality comparison.
class BoolFieldController extends ValueFieldController<bool> {
  BoolFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }) : super(areEqual: (bool x, bool y) => x == y);
}
