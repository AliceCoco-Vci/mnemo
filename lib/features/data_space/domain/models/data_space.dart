/// DataSpace 分组。
enum DataSpaceGroup {
  work('工作'),
  personal('个人');

  const DataSpaceGroup(this.label);

  /// 分组显示名称。
  final String label;
}

/// DataSpace 图标语义。
///
/// 只描述业务含义，不直接依赖 Flutter IconData。
enum DataSpaceIcon { work, person, life }

/// DataSpace 领域模型。
///
/// 描述一个独立的数据空间。
/// 不依赖 Flutter Widget、ThemeData 或 Theme Token。
class DataSpace {
  /// 唯一标识。
  final String id;

  /// 名称。
  final String name;

  /// 描述。
  final String description;

  /// 所属分组。
  final DataSpaceGroup group;

  /// 表数量。
  ///
  /// 当前用于 Mock 数据展示。
  /// 后续接入 DataTable 后，应通过关联数据动态统计，
  /// 不再将其作为 DataSpace 的持久化字段。
  final int tableCount;

  /// 图标语义。
  final DataSpaceIcon icon;

  /// 卡片强调色，使用 HEX 字符串。
  final String accentColor;

  /// 卡片强调背景色，使用 HEX 字符串。
  final String accentBackgroundColor;

  const DataSpace({
    required this.id,
    required this.name,
    required this.description,
    required this.group,
    required this.tableCount,
    required this.icon,
    required this.accentColor,
    required this.accentBackgroundColor,
  });
}
