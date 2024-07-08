// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_app/features/todo/controllers/todo_controller.dart';

import 'package:flutter_todo_app/main.dart';
import 'package:flutter_todo_app/widgets/appbar/custom_app_bar.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Todo App Flow Tests', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodoController()),
        ],
        child: const MyApp(),
      ),
    );

    // Verify that `TodoView` is displayed.
    expect(find.byType(CustomAppBar), findsOneWidget);
    expect(find.text('To-Do List'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    // expect(find., matcher)

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that `TodoFormView` is displayed.
    expect(find.text('Add New To-Do List'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.text('Create Now'), findsOneWidget);
  });

  testWidgets('Create Todo Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TodoController()),
        ],
        child: const MyApp(),
      ),
    );

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Enter inputs
    await tester.enterText(find.byType(TextField).at(0), 'New Todo');
    await tester.enterText(find.byType(TextField).at(1), '01 Jul 2024');
    await tester.enterText(find.byType(TextField).at(2), '03 Jul 2024');

    // Tap the save button and trigger a frame.
    await tester.tap(find.text('Create Now'));
    await tester.pumpAndSettle();

    // Verify page navigate back to `TodoView`.
    expect(find.text('To-Do List'), findsOneWidget);
  });
}
