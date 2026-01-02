import 'package:flutter/material.dart';
import 'package:foo_form_field/foo_form_field.dart';

import '../widgets/controller_test_buttons.dart';
import '../widgets/example_screen.dart';
enum SellingOrderStatus {
  pending,
  approved,
  rejected,
}


class SingleSelectionFormFieldExample extends StatefulWidget {
  const SingleSelectionFormFieldExample({super.key});

  @override
  State<SingleSelectionFormFieldExample> createState() => _SingleSelectionFormFieldExampleState();
}

class _SingleSelectionFormFieldExampleState extends State<SingleSelectionFormFieldExample> {
  final _controller = SingleSelectionFieldController<SellingOrderStatus>(
    initialValue: SellingOrderStatus.approved,
    areEqual: (a, b) => a == b,
    items: SellingOrderStatus.values,
  );

  @override
  Widget build(BuildContext context) {
    return ExampleScreen(
      title: "Single Selection Form Field",
      fieldBuilder: () => SingleSelectionFormField(
        itemBuilder: (item) => Text(item.name),
        controller: _controller,
        onTap: (context) {
          showModalBottomSheet(
            context: context,
            builder: (context) => SelectionBottomSheet.singleSelection(
              controller: _controller,
              selectionListView: SingleSelectionListView(
                itemBuilder: (context,index) => Text(_controller.items[index].name),
                controller: _controller,
                separatorBuilder: (context, index) =>SizedBox(height: 200,),
              ),
            ),
          );
        },
      ),
      children: [
        ControllerTestButtons(
          title: "Single Selection Controller Test Buttons",
          controller: _controller,
          firstDummyValue: SellingOrderStatus.pending,
          secondDummyValue: SellingOrderStatus.approved,
          valueToString: (value) => value.name,
        ),
      ],
    );
  }
}