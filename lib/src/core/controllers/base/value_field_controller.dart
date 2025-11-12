part of '../exporter.dart';

/// Concrete field controller that works with identical field/client types.
class ValueFieldController<T> extends FooFieldController<T, T> {
  /// Uses `SameValueMapper` so no conversion is required between layers.
  ValueFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    required super.areEqual,
  }) : super(mapper: SameValueMapper<T>());
}
