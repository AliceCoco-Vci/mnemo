import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/data_space.dart';

/// 当前 DataSpace 集合。
///
/// 第一版使用内置 Mock 数据。
/// 后续接入 DataSpaceRepository 后，再由 Repository 提供数据。
final dataSpacesProvider = Provider<List<DataSpace>>((ref) {
  return _builtInDataSpaces;
});

/// 内置 DataSpace 测试数据。
const List<DataSpace> _builtInDataSpaces = [
  DataSpace(
    id: 'work',
    name: 'Work',
    description: 'Work-related information',
    group: DataSpaceGroup.work,
    tableCount: 12,
    icon: DataSpaceIcon.work,
    accentColor: '#6366F1',
    accentBackgroundColor: '#EEF2FF',
  ),
  DataSpace(
    id: 'personal',
    name: 'Personal',
    description: 'Personal notes and records',
    group: DataSpaceGroup.personal,
    tableCount: 8,
    icon: DataSpaceIcon.person,
    accentColor: '#16A34A',
    accentBackgroundColor: '#DCFCE7',
  ),
  DataSpace(
    id: 'life',
    name: 'Life',
    description: 'Everyday life',
    group: DataSpaceGroup.personal,
    tableCount: 5,
    icon: DataSpaceIcon.life,
    accentColor: '#DB2777',
    accentBackgroundColor: '#FCE7F3',
  ),
];
