class Strings {
  static const baseUrl = 'https://dummyjson.com/';
  static String getTodos(int skip) {
    return 'todos?limit=15&skip=$skip';
  }

  static const addTodo = 'todos/add';
  static String updateDeleteTodo(int id) {
    return 'todos/$id';
  }

  static const appTitle = 'Todo App';
  static const defaultErrorMessage = 'Sorry, an error occurred';
  static const noInternetErrorMessage = 'Check your internet connection';
  static const succeeded = 'succeeded';
  static const appBarTitle = 'Today\'s Tasks';
  static const emptyTasksListTitle = 'Your Tasks List is Empty!';
  static const emptyTasksListSubTitle =
      'You don\'t have any active tasks right now. Try to add some!';
  static const designWidth = 411.4285;
  static const designHight = 867.4285;
}
