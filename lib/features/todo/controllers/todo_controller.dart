import 'package:flutter/material.dart';
import 'package:flutter_todo_app/features/todo/models/todo_model.dart';
import 'package:flutter_todo_app/utils/local_storage.dart';
import 'package:intl/intl.dart';

class TodoController extends ChangeNotifier {
  List<Todo> _todos = [];

  final TodoLocalStorage _localStorage = TodoLocalStorage();

  List<Todo> get todos => _todos;

  TodoController() {
    loadData();
  }

  createTodo(Todo todo) {
    _todos.add(todo);
    _saveData();

    notifyListeners();
  }

  updateTodo(Todo todo) {
    int index = _todos.indexWhere((_todo) => _todo.id == todo.id);

    if (index > -1) {
      _todos[index] = Todo(
        id: todo.id,
        title: todo.title,
        startDate: todo.startDate,
        endDate: todo.endDate,
      );

      _saveData();
    }

    notifyListeners();
  }

  deleteTodo(String? id) {
    _todos.removeWhere((todo) => todo.id == id);
    _saveData();
    notifyListeners();
  }

  /// Calculate the remaining time for each [Todo].
  String timeLeft(Todo? todo) {
    if (todo == null) {
      return '-';
    }

    String? startDate = todo.startDate;
    String? endDate = todo.endDate;

    if (startDate.isNotEmpty && endDate.isNotEmpty) {
      try {
        DateFormat dateFormat = DateFormat('dd MMM yyyy');
        DateTime now = DateTime.now();
        DateTime endDateTime = dateFormat.parse(endDate);

        if (now.isAfter(endDateTime)) {
          return 'Expired';
        }

        Duration difference = endDateTime.difference(now);

        int days = difference.inDays;
        int hours = difference.inHours % 24;
        int minutes = difference.inMinutes % 60;

        return '$days days, $hours hrs, $minutes min';
      } catch (e) {
        debugPrint(e.toString());
        return '-';
      }
    }

    return '-';
  }

  Future<void> _saveData() async {
    await _localStorage.saveTodos(_todos);
  }

  Future<void> loadData() async {
    _todos = await _localStorage.loadTodos();
    notifyListeners();
  }

  Future<void> _clearData() async {
    await _localStorage.clearTodos();
  }
}

class TodoLocalStorage extends LocalStorage {
  TodoLocalStorage() : super('todo');

  Future<void> saveTodos(List<Todo> todos) async {
    final List<Map<String, dynamic>> json =
        todos.map((todo) => todo.toJson()).toList();
    await save(json);
  }

  Future<List<Todo>> loadTodos() async {
    final List<Map<String, dynamic>> data = await load();
    return data.map((json) => Todo.fromJson(json)).toList();
  }

  Future<void> clearTodos() async {
    await clear();
  }
}
