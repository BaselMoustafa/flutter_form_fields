import 'package:flutter/material.dart';

import '../package_colors.dart';


class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, 
    required this.isSelected,
    this.onTap,
  });

  final bool isSelected;
  final void Function(bool isSelected)? onTap;

  @override
  Widget build(BuildContext context) {
    
    Widget design = _WidgetDesign(isSelected: isSelected);

    if(onTap!=null){
      design = GestureDetector(
        onTap: ()=>onTap!(!isSelected),
        child: design,
      );
    }
    return design;
  }
}

class _WidgetDesign extends StatelessWidget {
  const _WidgetDesign({
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: PackageColors.primary(context)),
      ),
      child: isSelected ? Icon(
        Icons.check,
        size: 14,
        color: PackageColors.primary(context),
      ) : null,
    );
  }
}

