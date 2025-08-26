# FlashFeed News App

A modern, responsive Flutter news application that fetches live updates using the GNews API. Built with Material 3 design principles and clean architecture patterns.

## Features

- 📰 **Live News Updates**: Real-time news from GNews API
- 🏷️ **Category Selection**: Browse news by categories (Technology, Sports, Business, etc.)
- 🔍 **Search Functionality**: Search for specific news topics
- 📱 **Responsive Design**: Optimized for all device sizes
- 🌙 **Dark/Light Theme**: Automatic theme switching based on system preference
- 📱 **Material 3**: Modern, smooth UI with Material Design 3
- 🔄 **Pull to Refresh**: Easy content refresh
- 📖 **Article Details**: Full article view with source links
- 🚀 **Fast Performance**: Optimized image loading and caching

## Project Structure

```
lib/
├── config/
│   └── api_config.dart          # API configuration and keys
├── models/
│   └── article.dart             # Article data model
├── providers/
│   └── news_provider.dart       # State management with Provider
├── screens/
│   ├── home_screen.dart         # Main home screen with tabs
│   └── article_detail_screen.dart # Article detail view
├── services/
│   └── news_service.dart        # API service layer
├── utils/
│   └── app_theme.dart           # Theme configuration
├── widgets/
│   ├── article_card.dart        # News article card widget
│   ├── article_list.dart        # List of articles
│   ├── category_tabs.dart       # Category navigation tabs
│   ├── error_widget.dart        # Error display widget
│   ├── loading_widget.dart      # Loading indicator
│   └── search_bar.dart          # Search functionality
└── main.dart                    # App entry point
```

## Architecture

The app follows the **MVVM (Model-View-ViewModel)** architecture pattern:

- **Model**: `Article` class representing news data
- **View**: UI screens and widgets
- **ViewModel**: `NewsProvider` managing state and business logic
- **Service**: `NewsService` handling API calls
- **Provider**: State management solution

## Prerequisites

- Flutter SDK (3.8.1 or higher)
- Android Studio / VS Code
- Android SDK (for Android builds)
- GNews API key

## Setup Instructions

### 1. Clone and Navigate to Project
```bash
cd flashfeed_news
```

### 2. Get GNews API Key
1. Visit [GNews](https://gnews.io/)
2. Sign up for a free account
3. Get your API key
4. Replace `YOUR_GNEWS_API_KEY_HERE` in `lib/config/api_config.dart`

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Run the App
```bash
flutter run
```

## Building APK

### Debug APK
```bash
flutter build apk --debug
```

### Release APK
```bash
flutter build apk --release
```

The APK will be generated at: `build/app/outputs/flutter-apk/app-release.apk`

### Install APK on Device
1. Enable "Install from Unknown Sources" on your Android device
2. Transfer the APK file to your device
3. Open the APK file and install
4. Launch FlashFeed News app

## Configuration

### API Configuration
Edit `lib/config/api_config.dart`:
```dart
static const String apiKey = 'YOUR_ACTUAL_API_KEY';
static const String defaultCountry = 'us';  // Change country code
static const int defaultMaxArticles = 20;   // Adjust article count
```

### Categories
Modify categories in `lib/providers/news_provider.dart`:
```dart
static const List<String> categories = [
  'general',
  'technology',
  'business',
  // Add more categories...
];
```

## Dependencies

- **provider**: State management
- **http**: HTTP requests
- **cached_network_image**: Image caching
- **url_launcher**: Open external links
- **shared_preferences**: Local storage
- **connectivity_plus**: Network connectivity
- **material_3**: Material Design 3

## Customization

### Adding New Categories
1. Add category to `NewsProvider.categories`
2. Update `_getCategoryDisplayName()` in `CategoryTabs`
3. Test with API

### Modifying UI Theme
Edit `lib/utils/app_theme.dart`:
- Change color schemes
- Modify card styles
- Adjust typography

### Adding Features
- **Bookmarks**: Use `shared_preferences` for local storage
- **Offline Mode**: Implement local caching
- **Push Notifications**: Add Firebase integration
- **Social Sharing**: Implement share functionality

## Troubleshooting

### Common Issues

1. **API Key Error**
   - Verify API key in `api_config.dart`
   - Check GNews account status
   - Ensure API key has proper permissions

2. **Build Errors**
   - Run `flutter clean`
   - Delete `build/` folder
   - Run `flutter pub get` again

3. **Image Loading Issues**
   - Check internet connectivity
   - Verify image URLs from API
   - Check CORS policies

4. **Performance Issues**
   - Reduce `defaultMaxArticles` value
   - Implement pagination
   - Optimize image sizes

## API Limits

- **Free Tier**: 100 requests/day
- **Paid Plans**: Higher limits available
- **Rate Limiting**: Implement proper error handling

## Contributing

1. Fork the repository
2. Create feature branch
3. Make changes
4. Test thoroughly
5. Submit pull request

## License

This project is for educational purposes. Please respect GNews API terms of service.

## Support

For issues and questions:
- Check Flutter documentation
- Review GNews API documentation
- Open GitHub issue

---

**Happy Coding! 🚀**
