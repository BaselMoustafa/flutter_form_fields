import 'package:flutter/material.dart';

import '../../../foo_form_field.dart';
import '../../controllers/selection_field_controller.dart';

class SelectionBottomSheet<Entity> extends StatelessWidget {

  final SelectionFieldController controller;
  final Widget selectionListView;
  final Widget Function(BuildContext context, Widget selectionListView)? builder;

  const SelectionBottomSheet._({
    required this.builder,
    required this.selectionListView, 
    required this.controller,
  });

  static SelectionBottomSheet<Entity> singleSelection<Entity>({
    required SingleSelectionListView<Entity> selectionListView,
    required BaseSingleSelectionFieldController<Entity> controller,
    Widget Function(BuildContext context, Widget selectionListView)? builder,
  }) => SelectionBottomSheet._(
    selectionListView: selectionListView,
    builder: builder,
    controller: controller,
  );

  @override
  Widget build(BuildContext context) {
    if (builder != null) {
      return builder!(context, selectionListView);
    }

    return BottomSheet(
      enableDrag: true,
      onClosing: (){},
      builder: (BuildContext context) {
        return Column(
          spacing: 10,
          children: [
            SizedBox(height: 15),
            Container(
              height: 5,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade500,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Expanded(
              child: selectionListView,
            ),
            TextButton(
              onPressed: () {
                controller.commit();
                Navigator.pop(context);
              },
              child: Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}