import 'package:flutter/material.dart';

import '../tokens/common/theme_color.dart';
import '../tokens/common/theme_border.dart';
import '../tokens/common/theme_shadow.dart';
import '../tokens/common/theme_typography.dart';

class FlutterThemeAdapter {
  const FlutterThemeAdapter._();

  /// ThemeColor -> Flutter Color
  ///
  /// 支持：
  /// #RRGGBB
  /// #RRGGBBAA
  static Color toColor(ThemeColor color) {
    final hex = color.value.replaceFirst('#', '');

    if (!RegExp(r'^[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$').hasMatch(hex)) {
      throw FormatException('Invalid theme color: ${color.value}');
    }

    // Flutter 使用 AARRGGBB。
    // 主题模型使用 RRGGBB 或 RRGGBBAA。
    final argb = hex.length == 6
        ? 'FF$hex'
        : '${hex.substring(6, 8)}${hex.substring(0, 6)}';

    return Color(int.parse(argb, radix: 16));
  }

  /// ThemeTypography -> Flutter TextStyle
  static TextStyle toTextStyle(ThemeTypography typography) {
    final targetWeight = typography.fontWeight.clamp(100.0, 900.0);

    final fontWeight = FontWeight.values.reduce((a, b) {
      return (a.value - targetWeight).abs() <= (b.value - targetWeight).abs()
          ? a
          : b;
    });

    return TextStyle(
      fontFamily: typography.fontFamily,
      fontSize: typography.fontSize,
      fontWeight: fontWeight,
      letterSpacing: typography.letterSpacing,
      height: typography.lineHeight,
    );
  }

  /// ThemeBorder -> Flutter Border
  static Border? toBorder(ThemeBorder border) {
    if (!border.visible || border.width <= 0) {
      return null;
    }

    return Border.all(color: toColor(border.color), width: border.width);
  }

  /// ThemeBorder -> Flutter BorderRadius
  static BorderRadius toBorderRadius(ThemeBorder border) {
    return BorderRadius.circular(border.radius);
  }

  /// ThemeShadow -> Flutter BoxShadow
  static BoxShadow toBoxShadow(ThemeShadow shadow) {
    return BoxShadow(
      color: toColor(shadow.color),
      blurRadius: shadow.blurRadius,
      spreadRadius: shadow.spreadRadius,
      offset: Offset(shadow.offsetX, shadow.offsetY),
    );
  }

  /// 多个 ThemeShadow -> Flutter BoxShadow
  static List<BoxShadow> toBoxShadows(List<ThemeShadow> shadows) {
    return shadows.map(toBoxShadow).toList(growable: false);
  }
}
