import 'package:flutter/material.dart';
import 'package:flutter_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:flutter_todo_app/features/todo/models/todo_model.dart';
import 'package:flutter_todo_app/styles/app_style.dart';
import 'package:provider/provider.dart';

class TodoItemCard extends StatefulWidget {
  const TodoItemCard({
    super.key,
    this.todo,
    this.onTap,
  });

  final Todo? todo;
  final void Function()? onTap;

  @override
  State<TodoItemCard> createState() => _TodoItemCardState();
}

class _TodoItemCardState extends State<TodoItemCard> {
  @override
  Widget build(BuildContext context) {
    final todoController = Provider.of<TodoController>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppStyle.boxBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              0.7,
              0.7,
            ),
            blurRadius: 3.0,
            spreadRadius: 0.5,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppStyle.boxBorderRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: widget.onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.todo?.title ?? '',
                          style: AppStyle.text14BoldT1,
                        ),
                        IconButton(
                          onPressed: () =>
                              todoController.deleteTodo(widget.todo?.id),
                          iconSize: 16.0,
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _DateTimeDetailsBox(
                            label: 'Start Date',
                            value: widget.todo?.startDate ?? '-'),
                        _DateTimeDetailsBox(
                            label: 'End Date',
                            value: widget.todo?.endDate ?? '-'),
                        _DateTimeDetailsBox(
                          label: 'Time Left',
                          value: widget.todo?.isCompleted == true
                              ? '-'
                              : todoController.timeLeft(widget.todo),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
              width: double.infinity,
              child: Container(
                color: widget.todo?.isCompleted == true
                    ? Colors.green
                    : Colors.grey[300],
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _TodoItemCardFooter(
                        label: 'Status',
                        value: widget.todo?.isCompleted ?? false),
                    Row(
                      children: [
                        const Text(
                          'Tick if completed',
                          style: AppStyle.text11BoldT2,
                        ),
                        const SizedBox(width: 8.0),
                        Checkbox(
                          checkColor: Colors.white,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          activeColor: Colors.transparent,
                          splashRadius: 0,
                          side: BorderSide(width: 0.5),
                          value: widget.todo?.isCompleted,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.todo?.isCompleted = value!;
                            });
                          },
                        )
                      ],
                    ),
                    // _TodoItemCardFooter(
                    //     label: 'Tick if completed', value: 'Incomplete'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateTimeDetailsBox extends StatelessWidget {
  const _DateTimeDetailsBox({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyle.text11BoldT2,
        ),
        Text(
          value,
          style: AppStyle.text11BoldT1,
        ),
      ],
    );
  }
}

class _TodoItemCardFooter extends StatelessWidget {
  const _TodoItemCardFooter({
    super.key,
    required this.label,
    this.value = false,
  });

  final String label;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: AppStyle.text11BoldT2,
        ),
        const SizedBox(width: 8.0),
        Text(
          value ? 'Completed' : 'Incomplete',
          style: AppStyle.text11BoldT1,
        ),
      ],
    );
  }
}
