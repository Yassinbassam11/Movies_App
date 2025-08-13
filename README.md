# Movies App

A simple Flutter application that lists popular movies from **The Movie Database (TMDB)**, lets you view detailed information, toggle dark mode, and mark movies as favourites (in–memory for the current session).

## ✨ Features

- Fetch popular movies from TMDB API (HTTP + JSON parsing)
- Movie list with poster, rating, release date
- Hero animation into a detailed movie view
- Dark / Light mode toggle (runtime via `ValueNotifier`)
- Mark/unmark favourites (kept in memory only)
- Basic responsive layout (mobile focus)

## 🏗️ Architecture & State

Very lightweight: manual state management using `ValueNotifier` instances inside a singleton-like `AppBrain` (created in `main.dart`). No external state management libraries.

```
lib/
  main.dart                # App entry + theme + global appBrain
  view_model/app_brain.dart# Holds ValueNotifiers (movies, favourites, dark mode)
  services/                # API layer & constants
  models/                  # Data models (MovieModel)
  screens/                 # UI screens (list, details, favourites)
  widgets/                 # Reusable presentation widgets
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

| Component | Purpose |
|-----------|---------|
| `MoviesScreen` | Lists fetched movies + actions (favourites nav, dark mode) |
| `FavouriteScreen` | Shows in-memory favourite list |
| `MovieDetailsScreen` | Poster hero + overview + meta info |
| `MovieCard` | Row card with poster, rating, favourite toggle |

## ❤️ Favourites Logic

`MovieModel` has a mutable `isFavorite` flag. Tapping the heart updates both the flag and the `favouriteMovies` ValueNotifier list. Persistence (local DB / shared prefs) is NOT yet implemented.

### Limitations
- Favourites reset on app restart
- No offline cache
- Genre chips are static placeholders

## 🌗 Dark Mode

Dark mode controlled by `appBrain.isDarkMode` (ValueNotifier). Toggled from the `MoviesScreen` AppBar action.

## 🧪 Testing

No tests yet. Suggested initial tests:
- JSON deserialization of `MovieModel`
- Favourite toggle state mutation
- Dark mode toggle triggers rebuild

## 🛡️ Security Notes

- Do NOT commit real API tokens. Regenerate the currently committed token if this repository was made public.
- For production, consider: proxy backend, token rotation, rate-limiting.

## 🗺️ Roadmap / Ideas

- Persist favourites (e.g., `shared_preferences` or `hive`)
- Proper genre mapping from API response
- Infinite scroll / pagination
- Search movies
- Error + loading states (skeletons / shimmer)
- Pull to refresh
- Unit & widget tests
- i18n using Flutter localization

## 📦 Dependencies

| Package | Usage |
|---------|-------|
| `http`  | REST API calls |
| `flutter` (SDK) | UI framework |

## 🤝 Contributing

1. Fork & clone
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make changes & format (`dart format .` / `flutter analyze`)
4. Commit & push
5. Open a PR

## 📝 License

Add a suitable license (e.g., MIT) if you plan to open source. Currently unspecified.

---
Made with Flutter. Enjoy hacking on it! 🚀

