// import 'dart:ui';

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:foo_form_field/foo_form_field.dart';

// class IntTextFormField extends StatefulWidget {
//   const IntTextFormField({super.key});

//   final Object groupId;
//   final FooFieldController<String>? controller;
//   final FocusNode? focusNode;
//   final String? forceErrorText;
//   final InputDecoration? decoration;
//   final TextInputAction? textInputAction;
//   final TextStyle? style;
//   final StrutStyle? strutStyle;
//   final TextDirection? textDirection;
//   final TextAlign? textAlign;
//   final TextAlignVertical? textAlignVertical;
//   final bool? autofocus;
//   final bool? readOnly;
//   final bool? showCursor;
//   final String? obscuringCharacter;
//   final bool? obscureText;
//   final bool? autocorrect;
//   final bool? enableSuggestions;
//   final MaxLengthEnforcement? maxLengthEnforcement;
//   final bool? expands;
//   final int? maxLength;
//   final void Function(String? value)? onChanged;
//   final GestureTapCallback? onTap;
//   final bool? onTapAlwaysCalled;
//   final TapRegionCallback? onTapOutside;
//   final TapRegionUpCallback? onTapUpOutside;
//   final VoidCallback? onEditingComplete;
//   final ValueChanged<String>? onFieldSubmitted;
//   final void Function(String?)? onSaved;
//   final String? Function(String?)? validator;
//   final FormFieldErrorBuilder? errorBuilder;
//   final bool? ignorePointers;
//   final double? cursorWidth;
//   final double? cursorHeight;
//   final Radius? cursorRadius;
//   final Color? cursorColor;
//   final Color? cursorErrorColor;
//   final Brightness? keyboardAppearance;
//   final EdgeInsets? scrollPadding;
//   final bool? enableInteractiveSelection;
//   final TextSelectionControls? selectionControls;
//   final InputCounterWidgetBuilder? buildCounter;
//   final ScrollPhysics? scrollPhysics;
//   final Iterable<String>? autofillHints;
//   final AutovalidateMode? autovalidateMode;
//   final ScrollController? scrollController;
//   final String? restorationId;
//   final bool? enableIMEPersonalizedLearning;
//   final MouseCursor? mouseCursor;
//   final SpellCheckConfiguration? spellCheckConfiguration;
//   final TextMagnifierConfiguration? magnifierConfiguration;
//   final UndoHistoryController? undoController;
//   final AppPrivateCommandCallback? onAppPrivateCommand;
//   final bool? cursorOpacityAnimates;
//   final BoxHeightStyle? selectionHeightStyle;
//   final BoxWidthStyle? selectionWidthStyle;
//   final DragStartBehavior? dragStartBehavior;
//   final ContentInsertionConfiguration? contentInsertionConfiguration;
//   final Clip? clipBehavior;
//   final bool? stylusHandwritingEnabled;
//   final bool? canRequestFocus;

//   @override
//   State<IntTextFormField> createState() => _IntTextFormFieldState();
// }

// class _IntTextFormFieldState extends State<IntTextFormField> {
//   late final FooFieldController<String> _controller;
//   bool _controllerLocallyInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     if(widget.controller != null){
//       _controller = widget.controller!;
//     } else {
//       _controller = FooFieldController<int>();
//       _controllerLocallyInitialized = true;
//     }
//   }

//   @override
//   void dispose() {
//     if(_controllerLocallyInitialized){
//       _controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FooTextFormField(
//       controller: widget.controller,
//       focusNode: widget.focusNode,
//       forceErrorText: widget.forceErrorText,
//       decoration: widget.decoration,
//       textInputAction: widget.textInputAction,
//       style: widget.style,
//       strutStyle: widget.strutStyle,
//       textDirection: widget.textDirection,
//       textAlign: widget.textAlign,
//       textAlignVertical: widget.textAlignVertical,
//       autofocus: widget.autofocus,
//       readOnly: widget.readOnly,
//       showCursor: widget.showCursor,
//       obscuringCharacter: widget.obscuringCharacter,
//       obscureText: widget.obscureText,
//       autocorrect: widget.autocorrect,
//       enableSuggestions: widget.enableSuggestions,
//       maxLengthEnforcement: widget.maxLengthEnforcement,
//       expands: widget.expands,
//       maxLength: widget.maxLength,
//       onChanged: widget.onChanged,
//       onTap: widget.onTap,
//       onTapAlwaysCalled: widget.onTapAlwaysCalled,
//       onTapOutside: widget.onTapOutside,
//       onTapUpOutside: widget.onTapUpOutside,
//       onEditingComplete: widget.onEditingComplete,
//       onFieldSubmitted: widget.onFieldSubmitted,
//       onSaved: widget.onSaved,
//       validator: widget.validator,
//       errorBuilder: widget.errorBuilder,
//       inputFormatters: widget.inputFormatters,
//       ignorePointers: widget.ignorePointers,
//       cursorWidth: widget.cursorWidth,
//       cursorHeight: widget.cursorHeight,
//       cursorRadius: widget.cursorRadius,
//       cursorColor: widget.cursorColor,
//       cursorErrorColor: widget.cursorErrorColor,
//       keyboardAppearance: widget.keyboardAppearance,
//       scrollPadding: widget.scrollPadding,
//       enableInteractiveSelection: widget.enableInteractiveSelection,
//       selectionControls: widget.selectionControls,
//       buildCounter: widget.buildCounter,
//       scrollPhysics: widget.scrollPhysics,
//       autofillHints: widget.autofillHints,
//       autovalidateMode: widget.autovalidateMode,
//       scrollController: widget.scrollController,
//       restorationId: widget.restorationId,
//       enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
//       mouseCursor: widget.mouseCursor,
//       spellCheckConfiguration: widget.spellCheckConfiguration,
//       magnifierConfiguration: widget.magnifierConfiguration,
//       undoController: widget.undoController,
//       onAppPrivateCommand: widget.onAppPrivateCommand,
//       cursorOpacityAnimates: widget.cursorOpacityAnimates,
//       selectionHeightStyle: widget.selectionHeightStyle,
//       selectionWidthStyle: widget.selectionWidthStyle,
//       dragStartBehavior: widget.dragStartBehavior,
//       contentInsertionConfiguration: widget.contentInsertionConfiguration,
//       clipBehavior: widget.clipBehavior,  
//       stylusHandwritingEnabled: widget.stylusHandwritingEnabled,
//       canRequestFocus: widget.canRequestFocus,
//       keyboardType: TextInputType.number,
//     );
//   }
// }