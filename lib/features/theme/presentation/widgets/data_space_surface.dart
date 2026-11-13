import 'package:flutter/widgets.dart';

import 'data_space_theme_scope.dart';

enum DataSpaceSurfaceVariant { background, surface, card }

class DataSpaceSurface extends StatelessWidget {
  final Widget child;
  final DataSpaceSurfaceVariant variant;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const DataSpaceSurface({
    super.key,
    required this.child,
    this.variant = DataSpaceSurfaceVariant.surface,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final style = DataSpaceThemeScope.of(context);

    final decoration = switch (variant) {
      DataSpaceSurfaceVariant.background => BoxDecoration(
        color: style.backgroundColor,
      ),
      DataSpaceSurfaceVariant.surface => BoxDecoration(
        color: style.surfaceColor,
      ),
      DataSpaceSurfaceVariant.card => style.cardDecoration,
    };

    return Container(
      padding: padding,
      decoration: borderRadius == null
          ? decoration
          : decoration.copyWith(borderRadius: borderRadius),
      child: child,
    );
  }
}
