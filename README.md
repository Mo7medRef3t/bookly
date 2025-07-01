# 📚 Bookly

**Bookly** is a Flutter mobile app that helps users discover and preview free books using the Google Books API. It features smooth category browsing, detailed book pages, and a powerful search with debounce, all built on modern Flutter practices and the BLoC pattern.

---

## 🚀 Features

- 🔍 **Book Search**  
  Search by book title with a debounced input to reduce unnecessary API calls.

- ✨ **Featured & Newest Lists**  
  Explore curated collections of popular and newly published books.

- 📖 **Detailed Book Pages**  
  View book titles, ratings, authors, and access preview links.

- 🔗 **Similar Books**  
  Discover related books based on categories.

- 🎨 **Responsive UI**  
  Includes smooth animations, dark theme support, and consistent typography.

- 🚀 **Robust Error Handling**  
  Manages API and network errors gracefully with user-friendly feedback.

---

## 🛠 Tech Stack

- **Flutter & Dart**: Cross-platform mobile app development.
- **BLoC**: Business Logic Component for state management.
- **Dio**: For HTTP requests to the Google Books API.
- **go_router**: Simplified navigation and routing.
- **cached_network_image**: Efficient image loading and caching.
- **url_launcher**: To open book previews in the browser.
- **get_it**: Dependency injection.
- **Google Fonts & Dartz**: For consistent typography and functional patterns.

---

## 🚀 Getting Started

```bash
git clone https://github.com/Mo7medRef3t/bookly.git
cd bookly
flutter pub get
flutter run
```

*Requires Flutter SDK 3.x+ and a connected emulator or device.*

---

## 📂 Project Structure

```bash
bookly/
├── core/         # Shared utilities & components
│   ├── constants.dart
│   ├── errors/
│   ├── utils/
│   └── widgets/
├── features/     # Feature-specific modules
│   ├── home/
│   ├── search/
│   └── splash/
├── main.dart     # App entry point
```

---

## 💡 Development Highlights

- Used Dio + Dartz to implement functional error handling with Either types.
- Added debounce to search inputs for optimal API usage.
- Managed navigation with go_router and clean dependency injection with get_it.
- Structured code with clear separation of concerns and feature modules for scalability.
