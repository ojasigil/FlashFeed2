import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';
import '../widgets/category_tabs.dart';
import '../widgets/search_bar.dart';
import '../widgets/article_list.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/settings_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewsProvider>().initialize();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    
    // Handle navigation based on index
    switch (index) {
      case 0: // Home - already here
        break;
      case 1: // Search
        // TODO: Navigate to search screen
        break;
      case 2: // Bookmarks
        // TODO: Navigate to bookmarks screen
        break;
      case 3: // Profile
        // TODO: Navigate to profile screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlashFeed'),
        leading: const SettingsMenu(),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Add refresh functionality
              context.read<NewsProvider>().refreshArticles();
            },
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: CategoryTabs(tabController: _tabController),
        ),
      ),
      body: Column(
        children: [
          const NewsSearchBar(),
          Expanded(
            child: Consumer<NewsProvider>(
              builder: (context, newsProvider, child) {
                if (newsProvider.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (newsProvider.error != null) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Theme.of(context).colorScheme.error,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: ${newsProvider.error}',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            newsProvider.refreshArticles();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                if (newsProvider.filteredArticles.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.article_outlined,
                          size: 64,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No articles found',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your search or check back later',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                return ArticleList(articles: newsProvider.filteredArticles);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }
}
