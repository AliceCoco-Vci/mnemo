import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_theme_provider.dart';
import '../../../../core/theme/adapters/data_space_theme_adapter.dart';
import '../../../../features/theme/domain/factories/built_in_theme_factory.dart';
import '../../../../features/theme/domain/models/data_space_theme_definition.dart';
import '../../../../features/theme/domain/resolvers/data_space_theme_resolver.dart';
import 'data_space_theme_preference_provider.dart';

/// DataSpace 主题解析请求。
///
/// 由 DataSpace ID 与 App 当前实际亮度组成。
typedef DataSpaceThemeRequest = ({String dataSpaceId, bool isDark});

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

/// 根据 DataSpace ID 和当前 App 实际亮度，获取最终主题定义。
///
/// isDark 仅用于 App Theme Binding 的选择，
/// 不代表 DataSpace Theme 自身具有日夜模式。
final resolvedDataSpaceThemeProvider =
    Provider.family<DataSpaceThemeDefinition, DataSpaceThemeRequest>((
      ref,
      request,
    ) {
      // 当前 App Theme 状态。
      final appState = ref.watch(appThemeProvider);

      // 当前 App Theme 对应的绑定。
      final binding = appState.currentBinding;

      // 根据 App 当前实际亮度选择绑定的 DataSpace Theme。
      final boundDataSpaceThemeId = binding == null
          ? null
          : request.isDark
          ? binding.darkDataSpaceThemeId
          : binding.lightDataSpaceThemeId;

      // 当前 DataSpace 的主题偏好。
      final preference = ref.watch(
        dataSpaceThemePreferenceProvider(request.dataSpaceId),
      );

      // 当前可用的 DataSpace Theme 集合。
      final themes = ref.watch(dataSpaceThemesProvider);

      return ref
          .watch(dataSpaceThemeResolverProvider)
          .resolve(
            preference: preference,
            boundDataSpaceThemeId: boundDataSpaceThemeId,
            themes: themes,
            defaultTheme: themes[BuiltInThemeFactory.defaultDataSpaceThemeId]!,
          );
    });

/// 获取最终的 Flutter DataSpace 样式。
final dataSpaceThemeStyleProvider =
    Provider.family<DataSpaceThemeStyle, DataSpaceThemeRequest>((ref, request) {
      final definition = ref.watch(resolvedDataSpaceThemeProvider(request));

      return const DataSpaceThemeAdapter().adapt(definition);
    });
