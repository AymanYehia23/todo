# Todo App

A simple Todo app built using Flutter that allows users to create, list, update, and delete todos.

## Features

- **List All Todos**: View a list of all todos.
- **Create New Todo**: Add a new todo to the list.
- **Update Todo**: Edit an existing todo (completed/uncompleted).
- **Delete Todo**: Remove a todo from the list.

## Table of Contents

- [Getting Started](#getting-started)
- [Running the App](#running-the-app)
- [Testing the App](#testing-the-app)
- [App Structure](#app-structure)
- [Dependencies](#dependencies)

## Getting Started

To get started with the Todo app, you'll need to have Flutter installed on your machine. If you haven't installed Flutter yet, follow the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

### Prerequisites

- Flutter SDK
- Dart SDK
- An IDE like Visual Studio Code or Android Studio

### Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/your-username/todo-app.git
   cd todo-app
2. **Install dependencies**:
    ```sh
   Install dependencies
    
### Running the App
1. **Run on an Android emulator:**
   ```sh
   flutter emulators --launch <emulator_id>
   flutter run
2. **Run on an iOS simulator:**
   ```sh
   open -a Simulator
   flutter run

### Testing the App
    flutter test

### App Structure
    todo/
    ├── lib/
    │   ├── main.dart
    |   ├── core
    |   |   └── strings.dart
    |   ├── data
    |   |   └── models
    |   |       └── todo.dart
    |   |   └── repositories
    |   |       └── todo_repos.dart
    |   |   └── http
    |   |       └── http_service.dart
    |   |   └── data_providers
    |   |       └── add_todo_api.dart
    |   |       └── delete_todo_api.dart
    |   |       └── get_todos_api.dart
    |   |       └── update_todo_api.dart
    |   ├── logic
    |   |   └── todos_provider.dart
    │   ├── presentation
    |   |   └── screens
    |   |       └── home_screen.dart
    |   |   └── widgets
    |   |       └── add_task_widget.dart
    |   |       └── empty_tasks_list_widget.dart
    |   |       └── snack_bar_widget.dart
    |   |       └── todo_widget.dart
    └── assets
    └── pubspec.yaml
    
**Explanation**
  - *lib/main.dart:* The entry point of the application.
  - *lib/core/strings.dart:* The constant strings for the application
  - *lib/data/models/todo.dart:* The Todo model defines the data structure.
  - *lib/data/repositories/todo_repos.dart:* The middle layer between the logic and data-fetching mechanisms
  - *lib/data/http/http_service.dart:* The helper class that handles the configurations and http methods using the Dio package
  - *lib/data/data_providers/add_todo_api.dart:* The entity that adds new todo to the remote server using its API
  - *lib/data/data_providers/delete_todo_api.dart:* The entity that deletes todo to the remote server using its API
  - *lib/data/data_providers/get_todos_api.dart:* The entity that gets all todo from the remote server using its API
  - *lib/data/data_providers/update_todo_api.dart:* The entity that updates todo to the remote server using its API
  - *lib/logic/todos_provider.dart:* The layer that controls the flow between the data layer and the presentation layer using Riverpod state-management
  - *lib/presentation/screens/home_screen.dart:* The main screen displays the list of todos and can perform (add - update - delete) functionality through the UI.
  - *lib/presentation/widgets/add_task_widget.dart:* The widget that handling adding new todo.
  - *lib/presentation/widgets/empty_tasks_list_widget.dart:* The widget that handling the empty state UI.
  - *lib/presentation/widgets/snack_bar_widget.dart:* The helper method for showing snackBars.
  - *lib/presentation/widgets/todo_widget.dart:* The widget that represent the todo item.


### Dependencies
**The app uses the following dependencies:**
  - flutter_riverpod: For state management.
  - flutter_screenutil: For UI responsiveness.
  - dio: For HTTP networking.
