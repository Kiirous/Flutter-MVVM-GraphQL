# 🌍 App Countries

## 🚀 Overview

This is a Flutter application that displays holidays from different countries, allowing users to plan their vacations based on national holidays and weekends. The app uses GraphQL to fetch real-time data and implements an MVVM architecture to ensure clean and organized code.

## 🛠️ Technologies Used

| Technology  | Description |
| ------------- | ------------- |
| Flutter  | Mobile development framework.  |
| Provider  | State management and dependency injection.  |
| GraphQL  | API for efficient and flexible requests.  |
| Flutter DotEnv  | Separation of sensitive configurations (.env).  |
| Hive  | Local cache for offline access.  |
| Lottie  | Elegant loading animations.  |
| Automated Testing  | Ensures quality and stability.  |
| CI/CD (GitHub Actions)  | Runs tests automatically on each push.  |
| Custom Result  | Native and alternative to fpdart or Either for better error handling.  |

## 📂 Architecture & Organization

This project follows the MVVM (Model-View-ViewModel) pattern, ensuring separation of concerns and modular code.

```
lib/
├── core/                # Core functionalities and utilities
├── data/                # Data sources, including API clients and local storage
├── di/                  # Dependency injection
├── domain/              # Business logic and entity definitions
├── graphql/             # GraphQL queries and mutations
├── models/              # Data models
├── repositories/        # Data access repositories
├── services/            # Auxiliary services (GraphQL, Hive, etc.)
├── presentation/        # UI-related logic and views
│   ├── view_data/       # Data structures for views
│   ├── view_models/     # ViewModels (Business logic)
│   ├── views/           # Application screens
└── main.dart            # App entry point
```

## 🎯 Features

✅ Displays a list of countries using GraphQL

✅ Instant filtering by name, country code, continent name, continent code and phone code.

✅ Work offline with Hive

✅ Dependency injection with Provider

✅ Efficient state management using Provider

✅ Secure configuration management using Flutter DotEnv

✅ Smooth loading animations with Lottie

✅ Automated testing for ViewModels and Services

✅ CI/CD with GitHub Actions ensuring continuous quality

✅ Robust error handling with Custom Result


## 🛠️ Setup & Execution

### 1️⃣ Install dependencies:

```
flutter pub get
```

### 2️⃣ Create a .env file at the project root:

```
GRAPHQL_ENDPOINT=https://example.com/graphql
```

### 3️⃣ Run the app:

```
flutter run
```

## 🧪 Automated Testing

Run tests:

```
flutter test
```

Tests are automatically executed via GitHub Actions on every push! 🚀

## 📌 Contributions

Feel free to open Issues and Pull Requests! Any help is welcome. 🎉

## 📄 License

This project is open-source and is licensed under MIT.

💡 If you like the project, don't forget to leave a ⭐ on the repository! 🚀
