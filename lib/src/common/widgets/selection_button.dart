import 'package:flutter/material.dart';

class SelectionButton extends StatefulWidget {
  const SelectionButton({
    super.key,
    required this.selectedItems,
    required this.onTap,
    this.separatorBuilder,
  });

  final List<Widget> selectedItems;
  final VoidCallback onTap;
  final Widget Function(BuildContext context,int index)? separatorBuilder;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  final ValueNotifier<int> _remainingCount = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: _displayedItems,
    );
  }
  
  List<Widget> get _displayedItems{
    final List<Widget> displayedItems = [];
    for (var i = 0; i < widget.selectedItems.length; i++) {
      displayedItems.add(widget.selectedItems[i]);
      if (i < widget.selectedItems.length - 1) {
        displayedItems.add(
          _separatorBuilder(context, i)
        );
      }
    }
    return displayedItems;
  }

  Widget _separatorBuilder(BuildContext context, int index){
    return widget.separatorBuilder?.call(context, index) ?? Text(" , ");
  }

  @override
  void dispose() {
    _remainingCount.dispose();
    super.dispose();
  }
}
