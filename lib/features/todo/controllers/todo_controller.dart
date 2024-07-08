import 'package:flutter/material.dart';
import 'package:flutter_todo_app/features/todo/models/todo_model.dart';
import 'package:intl/intl.dart';

class TodoController extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  createTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  updateTodo(Todo todo) {
    int index = todos.indexWhere((_todo) => _todo.id == todo.id);

    if (index > -1) {
      todos[index] = Todo(
        id: todo.id,
        title: todo.title,
        startDate: todo.startDate,
        endDate: todo.endDate,
      );
    }

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
}
