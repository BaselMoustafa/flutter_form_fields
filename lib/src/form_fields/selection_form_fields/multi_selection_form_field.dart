import 'package:flutter/material.dart';
import '../../../foo_form_field.dart';

class MultiSelectionFormField<Entity extends Object> extends StatelessWidget {
  
  final BaseMultiSelectionFieldController<Entity> controller;
  final Widget Function(BuildContext context, int index , Entity item) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final FooFormFieldProperties<List<Entity>>? properties;
  final InputDecoration? decoration;
  final void Function(BuildContext context) onTap;
  final Widget Function(BuildContext context, List<Entity>? value)? builder;

  const MultiSelectionFormField({
    super.key,
    required this.itemBuilder,
    required this.controller,
    required this.onTap,
    this.builder, 
    this.properties, 
    this.decoration, 
    this.separatorBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedValueFormField(
      controller: controller, 
      onTap: onTap, 
      decoration: decoration, 
      builder: _builder,
      properties: properties,
    );
  }

  Widget _builder(BuildContext context, List<Entity>? value){
    if (builder!=null) {
      return builder!.call(context,value);
    }

    final selectedItems = controller.value??[];
    final selectedItemWidgets = <Widget>[];
    for (var i = 0; i < selectedItems.length; i++) {
      selectedItemWidgets.add(itemBuilder(context, i, selectedItems[i]));
    }

    return SelectionButton(
      onTap: () => onTap(context), 
      selectedItems: selectedItemWidgets, 
      separatorBuilder: separatorBuilder,
    );
  }

}

