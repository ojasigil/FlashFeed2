import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/news_provider.dart';

class NewsSearchBar extends StatefulWidget {
  const NewsSearchBar({super.key});

  @override
  State<NewsSearchBar> createState() => _NewsSearchBarState();
}

class _NewsSearchBarState extends State<NewsSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) {
      context.read<NewsProvider>().clearSearch();
    } else {
      context.read<NewsProvider>().searchArticles(query.trim());
    }
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<NewsProvider>().clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for news...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _isSearching || _searchController.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: _clearSearch,
                  tooltip: 'Clear search',
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceVariant.withValues(alpha: 0.3),
        ),
        onChanged: (value) {
          setState(() {
            _isSearching = value.isNotEmpty;
          });
          if (value.isEmpty) {
            _performSearch('');
          }
        },
        onSubmitted: _performSearch,
        textInputAction: TextInputAction.search,
      ),
    );
  }
}
