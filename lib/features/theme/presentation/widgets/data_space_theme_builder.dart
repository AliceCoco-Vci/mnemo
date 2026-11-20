import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/data_space_theme_provider.dart';
import 'data_space_theme_scope.dart';

/// DataSpace Theme 构建器。
///
/// 根据当前 App Theme 的实际亮度，
/// 选择对应的 DataSpace Theme Binding。
class DataSpaceThemeBuilder extends ConsumerWidget {
  final String dataSpaceId;
  final Widget child;

  const DataSpaceThemeBuilder({
    super.key,
    required this.dataSpaceId,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 读取 Flutter 当前实际生效的亮度。
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // 根据 DataSpace ID 和 App 当前亮度获取主题。
    final style = ref.watch(
      dataSpaceThemeStyleProvider((dataSpaceId: dataSpaceId, isDark: isDark)),
    );

    return DataSpaceThemeScope(style: style, child: child);
  }
}
