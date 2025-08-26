import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';

class CategoryTabs extends StatelessWidget {
  final TabController tabController;

  const CategoryTabs({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
      builder: (context, newsProvider, child) {
        return TabBar(
          controller: tabController,
          isScrollable: true,
          tabs: NewsProvider.categories.map((category) {
            return Tab(
              text: category,
            );
          }).toList(),
          onTap: (index) {
            if (index == 0) {
              newsProvider.fetchTopHeadlines();
            } else {
              newsProvider.fetchArticlesByCategory(NewsProvider.categories[index]);
            }
          },
        );
      },
    );
  }
}
