import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data_space/domain/models/data_space.dart';
import '../../../data_space/presentation/providers/data_spaces_provider.dart';

/// Home 页面状态。
class HomeState {
  /// 当前选择的分组。
  ///
  /// null 表示全部。
  final DataSpaceGroup? selectedGroup;

  /// 当前搜索关键词。
  final String searchQuery;

  const HomeState({this.selectedGroup, this.searchQuery = ''});

  HomeState copyWith({
    DataSpaceGroup? selectedGroup,
    bool clearSelectedGroup = false,
    String? searchQuery,
  }) {
    return HomeState(
      selectedGroup: clearSelectedGroup
          ? null
          : selectedGroup ?? this.selectedGroup,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

/// Home 页面状态控制器。
class HomeController extends Notifier<HomeState> {
  @override
  HomeState build() {
    return const HomeState();
  }

  /// 切换分组。
  ///
  /// 传入 null 表示全部。
  void selectGroup(DataSpaceGroup? group) {
    state = state.copyWith(
      selectedGroup: group,
      clearSelectedGroup: group == null,
    );
  }

  /// 更新搜索关键词。
  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  /// 清空搜索关键词。
  void clearSearch() {
    state = state.copyWith(searchQuery: '');
  }
}

/// Home 页面状态 Provider。
final homeProvider = NotifierProvider<HomeController, HomeState>(
  HomeController.new,
);

/// 根据 Home 状态筛选 DataSpace。
final filteredDataSpacesProvider = Provider<List<DataSpace>>((ref) {
  final dataSpaces = ref.watch(dataSpacesProvider);
  final homeState = ref.watch(homeProvider);

  return dataSpaces.where((dataSpace) {
    // 分组筛选。
    final matchesGroup =
        homeState.selectedGroup == null ||
        dataSpace.group == homeState.selectedGroup;

    // 名称和描述搜索。
    final query = homeState.searchQuery.trim().toLowerCase();

    final matchesSearch =
        query.isEmpty ||
        dataSpace.name.toLowerCase().contains(query) ||
        dataSpace.description.toLowerCase().contains(query);

    return matchesGroup && matchesSearch;
  }).toList();
});
