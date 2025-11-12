part of '../exporter.dart';

/// Controller for string fields relying on simple equality comparison.
class StringFieldController extends ValueFieldController<String> {
  StringFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
  }) : super(areEqual: (String x, String y) => x == y);
}
