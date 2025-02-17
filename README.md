# TodoApp

A SwiftUI-based task management application following MVVM-C (Model-View-ViewModel-Coordinator) architecture.

## Architecture

### Coordinator Pattern
The app uses a coordinator pattern for navigation management, centralized in `MainCoordinator`. This provides:
- Centralized navigation logic
- Type-safe routing
- Separation of navigation concerns from views

### MVVM Pattern
Each feature follows MVVM architecture:
- **Models**: Data structures like `TodoTask`
- **Views**: SwiftUI views for UI representation
- **ViewModels**: Business logic and state management
- **Coordinator**: Navigation management

## Features

- Task Management
  - Create, read, update tasks
  - Set task priority (Low, Medium, High)
  - Mark tasks as completed
  - Due date assignment

- Analytics
  - View completed tasks count
  - View pending tasks count

- Settings
  - Toggle notifications
  - Toggle dark mode

## Dependencies

- SwiftUI
- UserDefaults (for persistence)

## Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

## Testing

The project includes:
- Unit tests for ViewModels
- UI tests for critical user flows

## Installation

1. Clone the repository
2. Open `TodoApp.xcodeproj` in Xcode
3. Build and run the project

## License

MIT License
