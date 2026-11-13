import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/adapters/data_space_theme_adapter.dart';
import '../../../../features/theme/domain/factories/built_in_theme_factory.dart';
import '../../../../features/theme/domain/models/data_space_theme_definition.dart';
import '../../../../features/theme/domain/resolvers/data_space_theme_resolver.dart';
import '../../../../app/theme/app_theme_provider.dart';
import 'data_space_appearance_provider.dart';

/// 当前加载的 DataSpace Theme 集合。
///
/// 第一版只有默认主题。
/// 后续由 ThemeRepository 提供完整主题集合。
final dataSpaceThemesProvider = Provider<Map<String, DataSpaceThemeDefinition>>(
  (ref) {
    final theme = BuiltInThemeFactory.createDefaultDataSpaceTheme();

    return {theme.id: theme};
  },
);

/// DataSpace Theme Resolver。
final dataSpaceThemeResolverProvider = Provider<DataSpaceThemeResolver>((ref) {
  return const DataSpaceThemeResolver();
});

/// 根据 DataSpace ID 获取最终主题定义。
final resolvedDataSpaceThemeProvider =
    Provider.family<DataSpaceThemeDefinition, String>((ref, dataSpaceId) {
      final appState = ref.watch(appThemeProvider);

      final appearance = ref.watch(dataSpaceAppearanceProvider(dataSpaceId));

      final themes = ref.watch(dataSpaceThemesProvider);

      return ref
          .watch(dataSpaceThemeResolverProvider)
          .resolve(
            appearance: appearance,
            currentAppThemeId: appState.currentThemeId,
            appThemeBindings: appState.bindings,
            themes: themes,
            defaultTheme: themes[BuiltInThemeFactory.defaultDataSpaceThemeId]!,
          );
    });

/// 获取最终的 Flutter DataSpace 样式。
final dataSpaceThemeStyleProvider =
    Provider.family<DataSpaceThemeStyle, String>((ref, dataSpaceId) {
      final definition = ref.watch(resolvedDataSpaceThemeProvider(dataSpaceId));

      return const DataSpaceThemeAdapter().adapt(definition);
    });
