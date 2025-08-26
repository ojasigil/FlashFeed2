import 'package:flutter/foundation.dart';
import '../models/article.dart';
import '../services/news_service.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();
  
  // State variables
  List<Article> _articles = [];
  List<Article> _filteredArticles = [];
  String _selectedCategory = 'general';
  bool _isLoading = false;
  String? _error;
  bool _isSearching = false;
  String _searchQuery = '';

  // Getters
  List<Article> get articles => _articles;
  List<Article> get filteredArticles => _filteredArticles;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isSearching => _isSearching;
  String get searchQuery => _searchQuery;

  // Available categories
  static const List<String> categories = [
    'general',
    'technology',
    'business',
    'sports',
    'entertainment',
    'health',
    'science',
  ];

  // Initialize with top headlines
  Future<void> initialize() async {
    await fetchTopHeadlines();
  }

  // Fetch top headlines
  Future<void> fetchTopHeadlines() async {
    _setLoading(true);
    _clearError();
    
    try {
      final articles = await _newsService.getTopHeadlines();
      _articles = articles;
      _filteredArticles = articles;
      _notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Fetch articles by category
  Future<void> fetchArticlesByCategory(String category) async {
    if (category == _selectedCategory && _articles.isNotEmpty) return;
    
    _setLoading(true);
    _clearError();
    _selectedCategory = category;
    
    try {
      final articles = await _newsService.getArticlesByCategory(category: category);
      _articles = articles;
      _filteredArticles = articles;
      _notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Search articles
  Future<void> searchArticles(String query) async {
    if (query.isEmpty) {
      _clearSearch();
      return;
    }
    
    _setLoading(true);
    _clearError();
    _isSearching = true;
    _searchQuery = query;
    
    try {
      final articles = await _newsService.searchArticles(query: query);
      _filteredArticles = articles;
      _notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  // Clear search
  void clearSearch() {
    _clearSearch();
    _notifyListeners();
  }

  // Refresh articles
  Future<void> refreshArticles() async {
    if (_isSearching) {
      await searchArticles(_searchQuery);
    } else if (_selectedCategory != 'general') {
      await fetchArticlesByCategory(_selectedCategory);
    } else {
      await fetchTopHeadlines();
    }
  }

  // Private helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }

  void _clearSearch() {
    _isSearching = false;
    _searchQuery = '';
    _filteredArticles = _articles;
  }

  void _notifyListeners() {
    notifyListeners();
  }

  // Check if API key is valid
  Future<bool> isApiKeyValid() async {
    return await _newsService.isApiKeyValid();
  }
}
