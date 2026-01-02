import 'package:flutter/material.dart';

import '../package_colors.dart';


class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({super.key, 
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
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: PackageColors.primary(context)),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:  isSelected ? PackageColors.primary(context) : PackageColors.transparent,
        ),
      ),
    );
  }
}

