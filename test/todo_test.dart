import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:flutter_todo_app/features/todo/models/todo_model.dart';
import 'package:flutter_todo_app/utils/utils.dart';

void main() {
  group('Todo Tests', () {
    setUp(() {
      TodoController todoController = TodoController();
      todoController.todos.clear();
    });

    test('Create Todo', () {
      Todo todo = Todo(
        id: generateShortId(),
        title: 'Testing Script',
        startDate: '3 May 2024',
        endDate: '5 May 2024',
      );

      TodoController todoController = TodoController();
      todoController.createTodo(todo);
      expect(todoController.todos.length, 1);
      expect(todoController.todos[0].id, todo.id);
      expect(todoController.todos[0].title, todo.title);
      expect(todoController.todos[0].startDate, todo.startDate);
      expect(todoController.todos[0].endDate, todo.endDate);
    });

    test('Update Todo', () {
      Todo todo = Todo(
        id: 't1',
        title: 'Testing Script',
        startDate: '3 May 2024',
        endDate: '5 May 2024',
      );

      Todo newTodo = Todo(
        id: 't1',
        title: 'Updated Testing Script',
        startDate: '8 May 2024',
        endDate: '9 May 2024',
      );

      TodoController todoController = TodoController();
      todoController.createTodo(todo);
      todoController.updateTodo(newTodo);

      expect(todoController.todos.length, 1);
      expect(todoController.todos[0].id, todo.id);
      expect(todoController.todos[0].id, newTodo.id);
      expect(todoController.todos[0].title, newTodo.title);
      expect(todoController.todos[0].startDate, newTodo.startDate);
      expect(todoController.todos[0].endDate, newTodo.endDate);
    });
  });
}
