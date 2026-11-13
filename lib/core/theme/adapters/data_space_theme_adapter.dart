import 'package:flutter/material.dart';

import '../../../features/theme/domain/models/data_space_theme_definition.dart';
import '../tokens/common/theme_border.dart';
import '../tokens/common/theme_color.dart';
import '../tokens/common/theme_shadow.dart';
import '../tokens/common/theme_spacing.dart';
import 'flutter_theme_adapter.dart';

/// 将 DataSpaceThemeDefinition 转换为 Flutter 可使用的样式。
///
/// 注意：
/// 1. 不生成 ThemeData，避免影响 App 全局主题。
/// 2. 只负责 DataSpace 内部的视觉样式转换。
/// 3. 不负责主题选择、绑定和资源加载。
class DataSpaceThemeAdapter {
  const DataSpaceThemeAdapter();

  DataSpaceThemeStyle adapt(DataSpaceThemeDefinition definition) {
    final colors = definition.colors;
    final typography = definition.typography;
    final components = definition.components;
    final decoration = definition.decoration;

    return DataSpaceThemeStyle(
      // Colors
      backgroundColor: FlutterThemeAdapter.toColor(colors.background),
      surfaceColor: FlutterThemeAdapter.toColor(colors.surface),
      primaryColor: FlutterThemeAdapter.toColor(colors.primary),
      textPrimaryColor: FlutterThemeAdapter.toColor(colors.textPrimary),
      textSecondaryColor: FlutterThemeAdapter.toColor(colors.textSecondary),
      dividerColor: FlutterThemeAdapter.toColor(colors.divider),

      // Typography
      headingStyle: FlutterThemeAdapter.toTextStyle(typography.heading),
      titleStyle: FlutterThemeAdapter.toTextStyle(typography.title),
      bodyStyle: FlutterThemeAdapter.toTextStyle(typography.body),
      captionStyle: FlutterThemeAdapter.toTextStyle(typography.caption),
      tableCellStyle: FlutterThemeAdapter.toTextStyle(typography.tableCell),

      // Card
      cardDecoration: _buildDecoration(
        background: components.card.background,
        border: components.card.border,
        shadows: decoration.shadows,
      ),

      // Dialog
      dialogDecoration: _buildDecoration(
        background: components.dialog.background,
        border: components.dialog.border,
        shadows: decoration.shadows,
      ),

      // Table
      tableBackgroundColor: FlutterThemeAdapter.toColor(
        components.table.background,
      ),
      tableHeaderBackgroundColor: FlutterThemeAdapter.toColor(
        components.table.headerBackground,
      ),
      tableRowBackgroundColor: FlutterThemeAdapter.toColor(
        components.table.rowBackground,
      ),
      tableAlternateRowBackgroundColor: FlutterThemeAdapter.toColor(
        components.table.alternateRowBackground,
      ),
      tableBorder: FlutterThemeAdapter.toBorder(components.table.border),
      tableRowHeight: components.table.rowHeight,

      // Spacing
      spacing: decoration.spacing,
    );
  }

  /// 将主题中的背景、边框和阴影转换为 BoxDecoration。
  BoxDecoration _buildDecoration({
    required ThemeColor background,
    required ThemeBorder border,
    required List<ThemeShadow> shadows,
  }) {
    return BoxDecoration(
      color: FlutterThemeAdapter.toColor(background),
      border: FlutterThemeAdapter.toBorder(border),
      borderRadius: FlutterThemeAdapter.toBorderRadius(border),
      boxShadow: FlutterThemeAdapter.toBoxShadows(shadows),
    );
  }
}

/// DataSpace 页面使用的 Flutter 样式对象。
///
/// 这是主题适配结果，不属于主题定义模型，
/// 不参与主题数据持久化。
class DataSpaceThemeStyle {
  // Colors
  final Color backgroundColor;
  final Color surfaceColor;
  final Color primaryColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color dividerColor;

  // Typography
  final TextStyle headingStyle;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;
  final TextStyle captionStyle;
  final TextStyle tableCellStyle;

  // Components
  final BoxDecoration cardDecoration;
  final BoxDecoration dialogDecoration;

  // Table
  final Color tableBackgroundColor;
  final Color tableHeaderBackgroundColor;
  final Color tableRowBackgroundColor;
  final Color tableAlternateRowBackgroundColor;
  final Border? tableBorder;
  final double tableRowHeight;

  // Spacing
  final ThemeSpacing spacing;

  const DataSpaceThemeStyle({
    required this.backgroundColor,
    required this.surfaceColor,
    required this.primaryColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.dividerColor,
    required this.headingStyle,
    required this.titleStyle,
    required this.bodyStyle,
    required this.captionStyle,
    required this.tableCellStyle,
    required this.cardDecoration,
    required this.dialogDecoration,
    required this.tableBackgroundColor,
    required this.tableHeaderBackgroundColor,
    required this.tableRowBackgroundColor,
    required this.tableAlternateRowBackgroundColor,
    required this.tableBorder,
    required this.tableRowHeight,
    required this.spacing,
  });
}
