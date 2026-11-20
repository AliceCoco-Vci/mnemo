import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data_space/domain/models/data_space.dart';
import '../providers/home_provider.dart';
import '../widgets/add_data_space_card.dart';
import '../widgets/data_space_card.dart';
import '../../../../app/navigation/widgets/app_top_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  bool _searching = false;

  final TextEditingController _searchController = TextEditingController();

  static const String _allGroup = '全部';

  List<String> get _groups => [
    _allGroup,
    ...DataSpaceGroup.values.map((group) => group.label),
  ];

  /// 根据 Tab 索引得到对应分组，0 表示全部。
  DataSpaceGroup? _groupForIndex(int index) =>
      index == 0 ? null : DataSpaceGroup.values[index - 1];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _groups.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  /// 展开或关闭搜索。
  void _toggleSearch() {
    setState(() {
      _searching = !_searching;

      if (!_searching) {
        _searchController.clear();
        ref.read(homeProvider.notifier).clearSearch();
      }
    });
  }

  /// 创建 DataSpace。
  void _createDataSpace() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Create DataSpace')));
  }

  /// 打开 DataSpace。
  void _openDataSpace(DataSpace dataSpace) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Open ${dataSpace.name}')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppTopBar(
        title: _searching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search DataSpaces',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  ref.read(homeProvider.notifier).updateSearchQuery(value);
                },
              )
            : const Text('Mnemo'),
        actions: [
          IconButton(
            onPressed: _toggleSearch,
            icon: Icon(_searching ? Icons.close_rounded : Icons.search_rounded),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: Column(
        children: [
          if (!_searching)
            Material(
              color: Colors.transparent,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                labelStyle: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelStyle: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                labelColor: theme.colorScheme.primary,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                indicatorColor: theme.colorScheme.primary,
                tabs: _groups.map((group) => Tab(text: group)).toList(),
              ),
            ),
          Expanded(child: _buildBody()),
        ],
      ),
    );
  }

  /// Home 主体内容。
  ///
  /// 搜索时展示跨分组搜索结果；否则通过 [TabBarView] 支持左右滑动切换分组。
  Widget _buildBody() {
    if (_searching) {
      return _buildHomeContent(
        ref.watch(filteredDataSpacesProvider(null)),
      );
    }

    return TabBarView(
      controller: _tabController,
      children: [
        for (var i = 0; i < _groups.length; i++)
          _buildHomeContent(
            ref.watch(filteredDataSpacesProvider(_groupForIndex(i))),
          ),
      ],
    );
  }

  /// Home DataSpace 网格。
  Widget _buildHomeContent(List<DataSpace> dataSpaces) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.15,
      ),
      itemCount: dataSpaces.length + 1,
      itemBuilder: (context, index) {
        // 最后一张卡片始终为新增入口。
        if (index == dataSpaces.length) {
          return AddDataSpaceCard(onTap: _createDataSpace);
        }

        final dataSpace = dataSpaces[index];

        return DataSpaceCard(
          dataSpace: dataSpace,
          onTap: () => _openDataSpace(dataSpace),
        );
      },
    );
  }
}
