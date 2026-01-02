import 'package:flutter/material.dart';

class SelectionButton extends StatefulWidget {
  const SelectionButton({
    super.key,
    required this.selectedItems,
    required this.onTap,
    required this.remainingWidgetBuilder,
    this.maxLines = 1,
    this.spacing = 8,
    this.runSpacing = 8,
  });

  final int maxLines;
  final double spacing;
  final double runSpacing;
  final List<Widget> selectedItems;
  final VoidCallback onTap;
  final Widget Function(int remainingItemsCount) remainingWidgetBuilder;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  final ValueNotifier<int> _remainingCount = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...widget.selectedItems,
        widget.remainingWidgetBuilder(_remainingCount.value),
      ],
    );
    return Flow(
      delegate: _MaxLinesFlowDelegate(
        maxLines: widget.maxLines,
        spacing: widget.spacing,
        runSpacing: widget.runSpacing,
        onRemainingChanged: (count) {
          if (_remainingCount.value != count) {
            _remainingCount.value = count;
          }
        },
      ),
      children: [
        ...widget.selectedItems,

        /// Remaining widget (only built when needed)
        ValueListenableBuilder<int>(
          valueListenable: _remainingCount,
          builder: (_, count, __) {
            if (count == 0) return const SizedBox.shrink();
            return widget.remainingWidgetBuilder(count);
          },
        ),

        /// Close button — tap only here
        InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(24),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.close),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _remainingCount.dispose();
    super.dispose();
  }
}

class _MaxLinesFlowDelegate extends FlowDelegate {
  _MaxLinesFlowDelegate({
    required this.maxLines,
    required this.spacing,
    required this.runSpacing,
    required this.onRemainingChanged,
  });

  final int maxLines;
  final double spacing;
  final double runSpacing;
  final ValueChanged<int> onRemainingChanged;

  @override
  void paintChildren(FlowPaintingContext context) {
    double x = 0;
    double y = 0;
    int line = 1;

    final maxWidth = context.size.width;
    int paintedCount = 0;

    // Selected items
    for (int i = 0; i < context.childCount - 2; i++) {
      final size = context.getChildSize(i)!;

      if (x + size.width > maxWidth) {
        line++;
        if (line > maxLines) break;
        x = 0;
        y += size.height + runSpacing;
      }

      context.paintChild(
        i,
        transform: Matrix4.translationValues(x, y, 0),
      );

      x += size.width + spacing;
      paintedCount++;
    }

    final remaining = (context.childCount - 2) - paintedCount;
    onRemainingChanged(remaining);

    // Remaining widget
    if (remaining > 0 && line <= maxLines) {
      final index = context.childCount - 2;
      final size = context.getChildSize(index)!;

      if (x + size.width > maxWidth) {
        line++;
        if (line <= maxLines) {
          x = 0;
          y += size.height + runSpacing;
        }
      }

      if (line <= maxLines) {
        context.paintChild(
          index,
          transform: Matrix4.translationValues(x, y, 0),
        );
        x += size.width + spacing;
      }
    }

    // Close button
    final closeIndex = context.childCount - 1;
    final closeSize = context.getChildSize(closeIndex)!;

    if (x + closeSize.width > maxWidth) {
      x = 0;
      y += closeSize.height + runSpacing;
    }

    context.paintChild(
      closeIndex,
      transform: Matrix4.translationValues(x, y, 0),
    );
  }

  @override
  Size getSize(BoxConstraints constraints) =>
      Size(constraints.maxWidth, constraints.maxHeight);

  @override
  bool shouldRepaint(covariant _MaxLinesFlowDelegate oldDelegate) =>
      maxLines != oldDelegate.maxLines ||
      spacing != oldDelegate.spacing ||
      runSpacing != oldDelegate.runSpacing;
}
