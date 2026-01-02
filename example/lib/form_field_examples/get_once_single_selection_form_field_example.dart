import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foo_form_field/foo_form_field.dart';

import '../cubits/get_suppliers_cubit.dart';
import '../models/supplier.dart';
import '../widgets/example_screen.dart';

class GetOnceSingleSelectionFormFieldExample extends StatefulWidget {
  const GetOnceSingleSelectionFormFieldExample({super.key});

  @override
  State<GetOnceSingleSelectionFormFieldExample> createState() =>
      _GetOnceSingleSelectionFormFieldExampleState();
}

class _GetOnceSingleSelectionFormFieldExampleState
    extends State<GetOnceSingleSelectionFormFieldExample> {
  late final GetOnceSingleSelectionFieldController<Supplier> _controller;
  late final GetSuppliersCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GetSuppliersCubit();
    _controller = GetOnceSingleSelectionFieldController<Supplier>(
      areEqual: (a, b) => a.id == b.id,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<GetSuppliersCubit, GetSuppliersState>(
        listener: (context, state) {
          if (state is GetSuppliersSuccess) {
            _controller.setItems(newItems: state.suppliers);
          } else if (state is GetSuppliersFailed) {
            _controller.markAsFailed(message: state.message);
          }else if (state is GetSuppliersLoading) {
            _controller.markAsLoading();
          }
        },
        child: ExampleScreen(
          title: "Get Once Single Selection Form Field",
          fieldBuilder: () => SingleSelectionFormField<Supplier>(
            itemBuilder: (item) => Text('${item.name} (${item.email})'),
            controller: _controller,
            onTap: (context) {
              showModalBottomSheet(
                context: context,
                builder: (context) => SelectionBottomSheet.singleSelection(
                  controller: _controller,
                  selectionListView: SingleSelectionListView.getOnce(
                    controller: _controller,
                    itemBuilder: (context, index) => Text(
                      '${_controller.items[index].name} (${_controller.items[index].email})',
                    ),
                    get: (context) => _cubit.getSuppliers(),
                  ),
                ),
              );
            },
            properties: FooFormFieldProperties(
              validator: (value) => value == null ? "Value is required" : null,
              onChanged: (value) => log("Value Changed To: $value"),
              onSaved: (value) => log("Value Saved: $value"),
            ),
          ),
          children: [],
        ),
      ),
    );
  }
}

