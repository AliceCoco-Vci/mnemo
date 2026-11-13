import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/data_space_theme_provider.dart';
import 'data_space_theme_scope.dart';

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
    final style = ref.watch(dataSpaceThemeStyleProvider(dataSpaceId));

    return DataSpaceThemeScope(style: style, child: child);
  }
}
