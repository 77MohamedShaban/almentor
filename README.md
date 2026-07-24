# Almentor - Video-Based E-Learning Platform

Almentor is a Flutter-based mobile application that serves as a prototype for a video-based
e-learning platform. The project is built following **Clean Architecture** principles and utilizes
modern Flutter development practices.

## 📸 Screenshots

<div align="center">
   <h3>Onboarding & Splash</h3>
   <table style="width:100%">
    <tr>
      <td>
        <img width="200" alt="splash_screen" src="" />
      </td>
      <td>
        <img width="200" alt="splash_screen" src="" />
      </td>
      <td>
        <img width="200" alt="splash_screen" src="" />
      </td>
      <td>
        <img width="200" alt="splash_screen" src="" />
      </td>
    </tr>
  </table>
</div>

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (Stable channel)
- Android Studio / VS Code

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/77MohamedShaban/almentor.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd almentor
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Generate boilerplate code (DI & Serialization)**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
5. **Run the application**:
   ```bash
   flutter run
   ```

## 🚀 Features

- **Course Catalog**: Browse a list of available courses with titles, thumbnails, and durations.
- **Dynamic Search**: Real-time filtering of courses by title.
- **Video Player**:
    - Smooth video playback using `video_player`.
    - Custom controls (Play/Pause, Seeking).
    - **Resume Playback**: Automatically picks up from the last watched position.
- **Progress Tracking**:
    - Persistent progress bars on course cards and detail screens.
    - Real-time progress saving using `SharedPreferences` via `PrefsManager`.
- **Connectivity Management**:
    - Monitors internet connection status using `connectivity_plus`.
    - Automatically pauses video playback and saves progress if the connection is lost.
- **Image Caching**: Optimized performance with `cached_network_image`.
- **Responsive Design**: Consistent UI across different devices using `flutter_screenutil`.

## 🏗️ Architecture

The project is strictly organized into layers following **Clean Architecture**:

- **Domain Layer**: The core of the app, containing Entities, Repository Interfaces, and Use Cases.
- **Data Layer**: Responsible for data retrieval and persistence, including Models, Data Sources (
  Local DAO for JSON and SharedPreferences), and Repository Implementations.
- **Presentation Layer**: UI logic and components, managed by **Cubit** (Flutter Bloc) for clean
  state handling.

## 🛠️ Technologies & Libraries

- **State Management**: `flutter_bloc` (Cubit).
- **Dependency Injection**: `get_it` & `injectable`.
- **Local Storage**: `shared_preferences`.
- **Networking**: `connectivity_plus`.
- **Media**: `video_player`.
- **UI/UX**: `flutter_screenutil`, `page_transition`, `cached_network_image`.
- **Testing**: `mocktail`, `bloc_test`.

## 📁 Folder Structure

```
lib/
├── core/                   # Shared utilities and global configurations
│   ├── di/                 # Dependency Injection setup
│   ├── remote/             # Local and remote data management
│   ├── resources/          # App constants, themes, strings, and assets
│   ├── reusable_component/  # Shared UI components (AppBars, etc.)
│   └── routes_manager/     # Navigation and routing logic
├── features/               # Feature-based modular structure
│   ├── courses/            # Course listing and searching
│   │   ├── data/           # Models and Data Sources
│   │   ├── domain/         # Entities and Use Cases
│   │   └── presentation/   # UI and Cubits
│   └── course_detail/      # Video player and course details
└── main.dart               # Entry point
```

## 🧪 Testing

The project includes Unit and Widget tests:

- **Unit Tests**: Logic testing for Duration formatters and Model parsing.
- **Widget Tests**: UI testing for Detail Screens.

Run tests using:

```bash
flutter test
```

## 📝 License

This project is a private slice of the Almentor platform.
