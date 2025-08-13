# Movies App

A beautiful Flutter application that displays popular movies from **The Movie Database (TMDB)** with modern UI/UX design, dark/light theme support, and favorite movie management.

## ✨ Features

- 🎬 Fetch and display popular movies from TMDB API
- 🖼️ Movie list with high-quality posters, ratings, and release dates
- 🎭 Hero animations for smooth transitions to detailed movie views
- 🌓 Dark/Light mode toggle with beautiful theme transitions
- ❤️ Mark/unmark movies as favorites (in-memory for current session)
- 🏷️ Category tags with adaptive theming (grey for light theme, dark surface for dark theme)
- 📱 Responsive layout optimized for mobile devices
- 🎨 Modern Material Design 3 principles

## 🏗️ Architecture & State

Very lightweight: manual state management using `ValueNotifier` instances inside a singleton-like `AppBrain` (created in `main.dart`). No external state management libraries.

```
lib/
  main.dart                # App entry + theme configuration + global appBrain
  view_model/
    app_brain.dart         # State management with ValueNotifiers (movies, favourites, dark mode)
  services/                # API layer & constants
    api_services.dart      # HTTP service for TMDB API calls
    api_constants.dart     # API configuration and endpoints
  models/                  # Data models
    movie_model.dart       # Movie data structure with JSON serialization
  screens/                 # UI screens
    movies_screen.dart     # Main movie list screen
    movie_details_screen.dart # Detailed movie view
    favourite_screen.dart  # Favorites list screen
  widgets/                 # Reusable UI components
    movie_card.dart        # Movie list item with poster and info
    category_capsule.dart  # Category tags with adaptive theming
  constants/               # App-wide constants
  assets/images/           # Local image assets
```

## 🔑 API Integration

The app hits: `https://api.themoviedb.org/3/movie/popular` with a Bearer token.

Current code has a hard‑coded token in `lib/services/api_constants.dart` (NOT recommended for production). You should rotate that key and move it to a secure source.

### Recommended: Pass at build time

1. Remove the sensitive token from the repository.
2. Change `ApiConstants.apiKey` to:
	```dart
	static const String apiKey = String.fromEnvironment('TMDB_API_KEY');
	```
3. Run the app with:
	```bash
	flutter run --dart-define TMDB_API_KEY=YOUR_TMDB_READ_ACCESS_TOKEN
	```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.x compatible with `sdk: ^3.8.1` in `pubspec.yaml`)
- A TMDB account + Read Access Token (v4 auth)

### Install deps
```bash
flutter pub get
```

### Run (example)
```bash
flutter run --dart-define TMDB_API_KEY=YOUR_TMDB_READ_ACCESS_TOKEN
```

### Platforms
The project includes scaffolding for: Android, iOS, Web, Windows, macOS, Linux. Primary UI is mobile-oriented; desktop/web may need polish.

## 🧩 Key Widgets / Screens

| Component | Purpose | Recent Updates |
|-----------|---------|----------------|
| `MoviesScreen` | Lists fetched movies + actions (favourites nav, dark mode) | Enhanced theme toggle UI |
| `FavouriteScreen` | Shows in-memory favourite list | - |
| `MovieDetailsScreen` | Poster hero + overview + meta info | - |
| `MovieCard` | Row card with poster, rating, favourite toggle | - |
| `CategoryCapsule` | Movie category tags | **New**: Adaptive theming, grey color scheme for light mode |

## ❤️ Favourites Logic

`MovieModel` has a mutable `isFavorite` flag. Tapping the heart updates both the flag and the `favouriteMovies` ValueNotifier list. Persistence (local DB / shared prefs) is NOT yet implemented.

### Limitations
- Favourites reset on app restart
- No offline cache
- Genre chips are static placeholders

## � UI/UX Improvements

### Recent Updates (August 2025)
- **Enhanced Category Capsules**: Improved theming for category tags
  - Light theme: Subtle grey background (`Colors.grey.shade100`) with dark grey text
  - Dark theme: Maintains surface color with outline borders
  - Better contrast and visual hierarchy
- **Material Design 3**: Updated color schemes and component styling
- **Adaptive Theming**: Components automatically adapt to current theme mode

## �🌗 Dark Mode

Dark mode is elegantly controlled by `appBrain.isDarkMode` (ValueNotifier) and can be toggled from the `MoviesScreen` AppBar. The app features:
- Smooth theme transitions
- Adaptive component colors
- Consistent visual hierarchy across themes
- Material Design 3 color schemes

## 🧪 Testing

No tests yet. Suggested initial tests:
- JSON deserialization of `MovieModel`
- Favourite toggle state mutation
- Dark mode toggle triggers rebuild

## 🛡️ Security Notes

- Do NOT commit real API tokens. Regenerate the currently committed token if this repository was made public.
- For production, consider: proxy backend, token rotation, rate-limiting.

## 🗺️ Roadmap / Ideas

### Short Term
- 💾 Persist favourites using `shared_preferences` or `hive`
- 🏷️ Proper genre mapping from API response (replace static category chips)
- 🔄 Pull to refresh functionality
- ⚡ Loading states with skeletons/shimmer effects

### Medium Term  
- 🔍 Search movies functionality
- 📄 Infinite scroll/pagination for movie lists
- 🌐 i18n using Flutter localization
- 🧪 Unit & widget tests
- 🎭 Enhanced animations and micro-interactions

### Long Term
- 🎥 Movie trailers and video integration
- 👤 User profiles and cloud sync
- 📊 Movie recommendations
- 🔐 Advanced security and authentication

## 📦 Dependencies

| Package | Version | Usage |
|---------|---------|-------|
| `http` | `^1.5.0` | REST API calls to TMDB |
| `flutter` | SDK | UI framework |
| `flutter_lints` | `^5.0.0` | Code quality and linting |

### Flutter SDK Requirements
- **Minimum**: Flutter 3.8.1+
- **Dart**: Compatible with null safety
- **Platforms**: Android, iOS, Web, Windows, macOS, Linux

---

## 📸 Screenshots

*Add screenshots of your app in both light and dark modes to showcase the beautiful UI!*

## 🤝 Contributing

1. 🍴 Fork & clone the repository
2. 🌿 Create a feature branch: `git checkout -b feature/your-feature-name`
3. ✨ Make changes & ensure code quality (`dart format .` & `flutter analyze`)
4. ✅ Test your changes thoroughly
5. 📝 Commit with clear messages & push to your fork
6. 🚀 Open a Pull Request with detailed description

### Development Guidelines
- Follow Flutter/Dart style guidelines
- Ensure responsive design works across devices
- Test both light and dark themes
- Update documentation for new features

## 📝 License

This project is available under the MIT License. See the LICENSE file for more details.

---

**Made with ❤️ and Flutter**  
*A modern movie discovery experience* 🎬✨

