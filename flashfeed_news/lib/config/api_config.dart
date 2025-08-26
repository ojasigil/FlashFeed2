class ApiConfig {
  // GNews API Configuration
  static const String baseUrl = 'https://gnews.io/api/v4';
  
  // TODO: Replace with your actual GNews API key
  // Get your API key from: https://gnews.io/
  static const String apiKey = 'f31e777d25b5928e7215aeb46b83c215';
  
  // API Endpoints
  static const String topHeadlines = '/top-headlines';
  static const String searchArticles = '/search';
  
  // Default parameters
  static const String defaultLanguage = 'en';
  static const String defaultCountry = 'us';
  static const int defaultMaxArticles = 20;
  
  // Build API URL with parameters
  static String buildUrl(String endpoint, Map<String, String> params) {
    final queryParams = Map<String, String>.from(params);
    queryParams['token'] = apiKey;
    
    final queryString = queryParams.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');
    
    return '$baseUrl$endpoint?$queryString';
  }
}
