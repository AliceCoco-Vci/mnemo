import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data_space/domain/models/data_space.dart';
import '../../../data_space/presentation/providers/data_spaces_provider.dart';

/// Home 页面状态。
class HomeState {
  /// 当前搜索关键词。
  final String searchQuery;

  const HomeState({this.searchQuery = ''});

  HomeState copyWith({String? searchQuery}) {
    return HomeState(searchQuery: searchQuery ?? this.searchQuery);
  }
}

/// Home 页面状态控制器。
class HomeController extends Notifier<HomeState> {
  @override
  HomeState build() {
    return const HomeState();
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

/// 根据分组和搜索关键词筛选 DataSpace。
///
/// [group] 为 null 时表示全部。
final filteredDataSpacesProvider =
    Provider.family<List<DataSpace>, DataSpaceGroup?>((ref, group) {
  final dataSpaces = ref.watch(dataSpacesProvider);
  final searchQuery = ref.watch(homeProvider).searchQuery;

  return dataSpaces.where((dataSpace) {
    // 分组筛选。
    final matchesGroup = group == null || dataSpace.group == group;

    // 名称和描述搜索。
    final query = searchQuery.trim().toLowerCase();

    final matchesSearch =
        query.isEmpty ||
        dataSpace.name.toLowerCase().contains(query) ||
        dataSpace.description.toLowerCase().contains(query);

    return matchesGroup && matchesSearch;
  }).toList();
});
