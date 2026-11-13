import '../../../../core/theme/tokens/app/app_color_tokens.dart';
import '../../../../core/theme/tokens/app/app_typography_tokens.dart';
import '../../../../core/theme/tokens/app/app_component_tokens.dart';
import '../../../../core/theme/tokens/app/app_decoration_tokens.dart';

class AppThemeDefinition {
  final String id;
  final String name;
  final String? description;

  final int version;

  final AppColorTokens colors;
  final AppTypographyTokens typography;
  final AppComponentTokens components;
  final AppDecorationTokens decoration;

  final bool isBuiltIn;

  final DateTime createdAt;
  final DateTime updatedAt;

  const AppThemeDefinition({
    required this.id,
    required this.name,
    this.description,
    this.version = 1,
    required this.colors,
    required this.typography,
    required this.components,
    required this.decoration,
    this.isBuiltIn = false,
    required this.createdAt,
    required this.updatedAt,
  });
}
