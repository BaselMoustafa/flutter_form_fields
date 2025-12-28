part of '../../../core/controllers/exporter.dart';

class ValueFieldController<T> extends FooFieldController<T, T> {

  ValueFieldController({
    super.initialValue,
    super.enabled,
    super.forcedErrorText,
    required super.areEqual,
  }) : super(mapper: SameValueMapper<T>());
  
}
