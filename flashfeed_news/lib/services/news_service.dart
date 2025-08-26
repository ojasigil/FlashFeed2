import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/article.dart';

class NewsService {
  static final NewsService _instance = NewsService._internal();
  factory NewsService() => _instance;
  NewsService._internal();

  // Fetch top headlines
  Future<List<Article>> getTopHeadlines({
    String? category,
    String? country,
    int maxArticles = 20,
  }) async {
    try {
      final params = <String, String>{
        'lang': ApiConfig.defaultLanguage,
        'country': country ?? ApiConfig.defaultCountry,
        'max': maxArticles.toString(),
      };

      if (category != null && category.isNotEmpty) {
        params['topic'] = category;
      }

      final url = ApiConfig.buildUrl(ApiConfig.topHeadlines, params);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load headlines: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching headlines: $e');
    }
  }

  // Search articles
  Future<List<Article>> searchArticles({
    required String query,
    String? language,
    int maxArticles = 20,
  }) async {
    try {
      final params = <String, String>{
        'q': query,
        'lang': language ?? ApiConfig.defaultLanguage,
        'max': maxArticles.toString(),
      };

      final url = ApiConfig.buildUrl(ApiConfig.searchArticles, params);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search articles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching articles: $e');
    }
  }

  // Get articles by category
  Future<List<Article>> getArticlesByCategory({
    required String category,
    String? country,
    int maxArticles = 20,
  }) async {
    try {
      final params = <String, String>{
        'lang': ApiConfig.defaultLanguage,
        'country': country ?? ApiConfig.defaultCountry,
        'topic': category,
        'max': maxArticles.toString(),
      };

      final url = ApiConfig.buildUrl(ApiConfig.topHeadlines, params);
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final articles = data['articles'] as List;
        return articles.map((json) => Article.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load category articles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching category articles: $e');
    }
  }

  // Check if API key is valid
  Future<bool> isApiKeyValid() async {
    try {
      final params = <String, String>{
        'lang': 'en',
        'country': 'us',
        'max': '1',
      };

      final url = ApiConfig.buildUrl(ApiConfig.topHeadlines, params);
      final response = await http.get(Uri.parse(url));

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
