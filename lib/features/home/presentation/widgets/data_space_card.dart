import 'package:flutter/material.dart';

import '../../../../core/theme/adapters/flutter_theme_adapter.dart';
import '../../../../core/theme/tokens/common/theme_color.dart';

import '../../../data_space/domain/models/data_space.dart';

class DataSpaceCard extends StatelessWidget {
  final DataSpace dataSpace;
  final VoidCallback? onTap;

  const DataSpaceCard({super.key, required this.dataSpace, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final icon = _iconFor(dataSpace.icon);
    final accentColor = FlutterThemeAdapter.toColor(
      ThemeColor.fromHex(dataSpace.accentColor),
    );
    final accentBackgroundColor = FlutterThemeAdapter.toColor(
      ThemeColor.fromHex(dataSpace.accentBackgroundColor),
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.dividerColor.withValues(alpha: 0.5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: accentBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: accentColor, size: 24),
            ),
            const Spacer(),
            Text(
              dataSpace.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${dataSpace.tableCount} tables',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(DataSpaceIcon icon) {
    return switch (icon) {
      DataSpaceIcon.work => Icons.work_outline_rounded,
      DataSpaceIcon.person => Icons.person_outline_rounded,
      DataSpaceIcon.life => Icons.favorite_border_rounded,
    };
  }
}
