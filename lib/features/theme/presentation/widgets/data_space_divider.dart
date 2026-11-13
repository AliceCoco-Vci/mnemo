import 'package:flutter/material.dart';
import 'data_space_theme_scope.dart';

class DataSpaceDivider extends StatelessWidget {
  final double thickness;
  final double indent;
  final double endIndent;

  const DataSpaceDivider({
    super.key,
    this.thickness = 1,
    this.indent = 0,
    this.endIndent = 0,
  });

  @override
  Widget build(BuildContext context) {
    final style = DataSpaceThemeScope.of(context);

    return Divider(
      color: style.dividerColor,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
