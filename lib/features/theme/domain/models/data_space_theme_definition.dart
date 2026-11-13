import '../../../../core/theme/tokens/data_space/data_space_color_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_typography_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_component_tokens.dart';
import '../../../../core/theme/tokens/data_space/data_space_decoration_tokens.dart';

class DataSpaceThemeDefinition {
  final String id;
  final String name;
  final String? description;

  final int version;

  final DataSpaceColorTokens colors;
  final DataSpaceTypographyTokens typography;
  final DataSpaceComponentTokens components;
  final DataSpaceDecorationTokens decoration;

  final bool isBuiltIn;

  final DateTime createdAt;
  final DateTime updatedAt;

  const DataSpaceThemeDefinition({
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
