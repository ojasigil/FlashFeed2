# FlashFeed News App - Setup Guide

## Quick Start

### 1. Prerequisites
- Flutter SDK 3.8.1 or higher
- Android Studio / VS Code
- Android SDK (for Android builds)
- GNews API key

### 2. Get GNews API Key
1. Visit [GNews.io](https://gnews.io/)
2. Sign up for a free account
3. Get your API key from the dashboard
4. **IMPORTANT**: Replace `YOUR_GNEWS_API_KEY_HERE` in `lib/config/api_config.dart`

### 3. Install Dependencies
```bash
flutter pub get
```

### 4. Run the App
```bash
flutter run
```

## Detailed Setup

### Step 1: Verify Flutter Installation
```bash
flutter doctor
```
Ensure all components are properly installed and configured.

### Step 2: Configure API Key
Open `lib/config/api_config.dart` and replace:
```dart
static const String apiKey = 'YOUR_GNEWS_API_KEY_HERE';
```
with your actual API key:
```dart
static const String apiKey = 'abc123def456ghi789...';
```

### Step 3: Test the App
1. Connect an Android device or start an emulator
2. Run: `flutter run`
3. The app should launch and show a loading screen
4. If successful, you'll see news articles

### Step 4: Build APK
```bash
# Debug APK
flutter build apk --debug

# Release APK (recommended for distribution)
flutter build apk --release
```

## Troubleshooting

### Common Issues

#### 1. API Key Errors
- **Error**: "Failed to load headlines: 401"
- **Solution**: Check your API key in `api_config.dart`
- **Error**: "Failed to load headlines: 429"
- **Solution**: You've exceeded the free tier limit (100 requests/day)

#### 2. Build Errors
```bash
flutter clean
flutter pub get
flutter run
```

#### 3. Image Loading Issues
- Check internet connectivity
- Verify the GNews API is working
- Images are loaded from external URLs

#### 4. Dependencies Issues
```bash
flutter pub cache repair
flutter pub get
```

## Testing the App

### 1. Basic Functionality
- ✅ App launches without errors
- ✅ News articles load from API
- ✅ Category tabs work
- ✅ Search functionality works
- ✅ Article detail screen opens
- ✅ External links open in browser

### 2. UI Testing
- ✅ Material 3 design elements
- ✅ Responsive layout
- ✅ Dark/light theme switching
- ✅ Smooth animations
- ✅ Error handling displays

### 3. Performance Testing
- ✅ Fast app startup
- ✅ Smooth scrolling
- ✅ Image caching works
- ✅ Memory usage is reasonable

## Customization

### Adding New Categories
1. Edit `lib/providers/news_provider.dart`
2. Add to `categories` list
3. Update `_getCategoryDisplayName()` in `CategoryTabs`

### Changing Theme Colors
Edit `lib/utils/app_theme.dart`:
```dart
static const Color primaryColor = Color(0xFF1976D2); // Change this
```

### Modifying API Parameters
Edit `lib/config/api_config.dart`:
```dart
static const String defaultCountry = 'us';  // Change country
static const int defaultMaxArticles = 20;   // Change article count
```

## Deployment

### 1. Build Release APK
```bash
flutter build apk --release
```

### 2. Find APK File
The APK will be at:
```
build/app/outputs/flutter-apk/app-release.apk
```

### 3. Install on Device
1. Enable "Install from Unknown Sources"
2. Transfer APK to device
3. Open and install
4. Launch FlashFeed News

## API Usage

### GNews API Limits
- **Free Tier**: 100 requests/day
- **Paid Plans**: Higher limits available
- **Rate Limiting**: Implement proper error handling

### Supported Categories
- general
- technology
- business
- sports
- entertainment
- health
- science

### API Endpoints Used
- `/top-headlines` - Get headlines by category
- `/search` - Search articles by query

## Support

### Documentation
- [Flutter Documentation](https://docs.flutter.dev/)
- [GNews API Documentation](https://gnews.io/docs/v4)
- [Provider Package](https://pub.dev/packages/provider)

### Common Commands
```bash
# Check Flutter version
flutter --version

# Check connected devices
flutter devices

# Run with specific device
flutter run -d <device-id>

# Build for specific platform
flutter build apk --release
flutter build ios --release
```

---

**Need Help?**
1. Check this guide first
2. Review error messages carefully
3. Verify API key configuration
4. Check Flutter installation
5. Open an issue on GitHub

**Happy Coding! 🚀**
