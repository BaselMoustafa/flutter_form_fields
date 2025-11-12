part of '../exporter.dart';

/// Convertible range controller that keeps the overall value synchronized with its min and max bounds.
///
/// Uses `BoundryController` builders to create bound controllers on demand
/// and wires listeners so that changes propagate between the range and its bounds.
class ConvertableRangeFieldController<
  O,
  I,
  BoundryController extends ConvertableRangeBoundryFieldController<O, I>
>
    extends FooFieldController<Range<O>, Range<I>> {
  BoundryController? _minValueController;
  BoundryController? _maxValueController;

  /// Returns the minimum bound controller, creating it lazily when first accessed.
  BoundryController get minValueController {
    _minValueController ??= minBoundryControllerBuilder(this);
    return _minValueController!;
  }

  /// Returns the maximum bound controller, creating it lazily when first accessed.
  BoundryController get maxValueController {
    _maxValueController ??= maxBoundryControllerBuilder(this);
    return _maxValueController!;
  }

  final bool Function(O x, O y) areEqualValues;
  final FieldValueMapper<O, I> valueMapper;
  final BoundryController Function(
    ConvertableRangeFieldController<O, I, BoundryController>
    rangeFieldController,
  )
  minBoundryControllerBuilder;
  final BoundryController Function(
    ConvertableRangeFieldController<O, I, BoundryController>
    rangeFieldController,
  )
  maxBoundryControllerBuilder;

  /// Creates the controller with the bound controller builders, mapper, and equality logic.
  ConvertableRangeFieldController({
    super.enabled,
    super.initialValue,
    super.forcedErrorText,
    required this.valueMapper,
    required this.areEqualValues,
    required this.minBoundryControllerBuilder,
    required this.maxBoundryControllerBuilder,
  }) : super(
         mapper: valueMapper.toRangeMapper(areEqualOutputs: areEqualValues),
         areEqual: (Range<O> x, Range<O> y) => x == y,
       );

  @override
  /// Attaches the form field state and ensures sync listeners are wired.
  void setFormFieldState(FormFieldState<Range<I>> formFieldState) {
    super.setFormFieldState(formFieldState);
    _invokeSyncers();
  }

  @override
  /// Enables or disables both bound controllers along with the base controller.
  set enabled(bool value) {
    minValueController.enabled = value;
    maxValueController.enabled = value;
    super.enabled = value;
  }

  @override
  /// Saves the bounds first, then persists the overall range value.
  void save() {
    return excute(
      toExecute: (FormFieldState<Range<I?>> formFieldState) {
        minValueController.save();
        maxValueController.save();
        super.save();
      },
    );
  }

  @override
  /// Validates the bound controllers before validating the range itself.
  bool validate() {
    return excute<bool>(
      toExecute: (FormFieldState<Range<I?>> formFieldState) {
        bool isValidMin = minValueController.validate();
        bool isValidMax = maxValueController.validate();
        if (isValidMin && isValidMax) {
          return super.validate();
        }
        return false;
      },
    );
  }

  /// Hooks listeners that keep the range and bounds in sync.
  void _invokeSyncers() {
    addListener(_onRangeChanged);
    minValueController.addListener(_onMinValueChanged);
    maxValueController.addListener(_onMaxValueChanged);
  }

  /// Removes the synchronization listeners.
  void _removeSyncers() {
    removeListener(_onRangeChanged);
    minValueController.removeListener(_onMinValueChanged);
    maxValueController.removeListener(_onMaxValueChanged);
  }

  /// Updates the bound controllers when the range value changes.
  void _onRangeChanged() {
    if (value?.min != minValueController.value) {
      minValueController.value = value?.min;
    }
    if (value?.max != maxValueController.value) {
      maxValueController.value = value?.max;
    }
  }

  /// Reflects minimum bound changes back into the overall range value.
  void _onMinValueChanged() {
    if (value?.min == minValueController.value) {
      return;
    }
    value = Range<O>(
      min: minValueController.value,
      max: value?.max,
      areEqual: areEqualValues,
    );
  }

  /// Reflects maximum bound changes back into the overall range value.
  void _onMaxValueChanged() {
    if (value?.max == maxValueController.value) {
      return;
    }
    value = Range<O>(
      min: value?.min,
      max: maxValueController.value,
      areEqual: areEqualValues,
    );
  }

  @override
  /// Cleans up listeners and disposes the bound controllers.
  void dispose() {
    _removeSyncers();
    minValueController.dispose();
    maxValueController.dispose();
    super.dispose();
  }
}
