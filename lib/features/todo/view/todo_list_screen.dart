import 'package:flutter/material.dart';
import 'package:flutter_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:flutter_todo_app/features/todo/models/todo_model.dart';
import 'package:flutter_todo_app/features/todo/view/todo_form_screen.dart';
import 'package:flutter_todo_app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_todo_app/widgets/button/custom_floating_button.dart';
import 'package:flutter_todo_app/widgets/responsive.dart';
import 'package:flutter_todo_app/widgets/todo/todo_item_card.dart';
import 'package:provider/provider.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    List<Todo> todos = context.watch<TodoController>().todos;

    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBar(title: 'To-Do List'),
        backgroundColor: Colors.yellow,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: todos.isNotEmpty
              ? Column(
                  children: todos
                      .map(
                        (todo) => TodoItemCard(
                          todo: todo,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TodoFormView(todo: todo),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text("Click '+' button to create your first To-Do"),
                  ),
                ),
        ),
      ),
      floatingActionButton: CustomFloatingButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TodoFormView(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
