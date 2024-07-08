import 'package:flutter/material.dart';
import 'package:flutter_todo_app/features/todo/controllers/todo_controller.dart';
import 'package:flutter_todo_app/features/todo/models/todo_model.dart';
import 'package:flutter_todo_app/styles/palette.dart';
import 'package:flutter_todo_app/utils/datetime_formatter.dart';
import 'package:flutter_todo_app/utils/utils.dart';
import 'package:flutter_todo_app/widgets/appbar/custom_app_bar.dart';
import 'package:flutter_todo_app/widgets/button/rounded_rectangle_button.dart';
import 'package:flutter_todo_app/widgets/text_field/custom_text_field.dart';
import 'package:provider/provider.dart';

class TodoFormView extends StatefulWidget {
  const TodoFormView({super.key, this.todo});

  final Todo? todo;

  @override
  State<TodoFormView> createState() => _TodoFormViewState();
}

class _TodoFormViewState extends State<TodoFormView> {
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _startDateCtrl = TextEditingController();
  final TextEditingController _endDateCtrl = TextEditingController();

  Future<String?> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2030),
      context: context,
    );

    return todoDate(pickedDate);
  }

  void onCreateTodo() {
    if (_titleCtrl.text.isEmpty) {
      const snackBar = SnackBar(
        content: Text('Title is required'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    Todo todo = Todo(
      id: widget.todo?.id ?? generateShortId(),
      title: _titleCtrl.text,
      startDate: _startDateCtrl.text,
      endDate: _endDateCtrl.text,
    );

    if (widget.todo != null) {
      Provider.of<TodoController>(context, listen: false).updateTodo(todo);
    } else {
      Provider.of<TodoController>(context, listen: false).createTodo(todo);
    }

    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    _titleCtrl.text = widget.todo?.title ?? '';
    _startDateCtrl.text = widget.todo?.startDate ?? '';
    _endDateCtrl.text = widget.todo?.endDate ?? '';
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    _startDateCtrl.dispose();
    _endDateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isCompleted = widget.todo?.isCompleted ?? false;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Add New To-Do List'),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('To-Do Title'),
                      const SizedBox(height: 8.0),
                      CustomTextField(
                        labelText: 'Please key in your To-Do title here',
                        controller: _titleCtrl,
                        maxLines: 5,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        readOnly: isCompleted,
                      ),
                      const SizedBox(height: 12.0),
                      const Text('Start Date'),
                      const SizedBox(height: 8.0),
                      CustomTextField(
                        labelText: 'Select a date',
                        controller: _startDateCtrl,
                        readOnly: true,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.calendar_month_rounded,
                            color: Palette.t3,
                          ),
                          onPressed: isCompleted
                              ? null
                              : () async {
                                  String? date = await selectDate();
                                  _startDateCtrl.text = date ?? '';
                                },
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      const SizedBox(height: 12.0),
                      const Text('Estimated End Date'),
                      const SizedBox(height: 8.0),
                      CustomTextField(
                        labelText: 'Select a date',
                        controller: _endDateCtrl,
                        readOnly: true,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.calendar_month_rounded,
                            color: Palette.t3,
                          ),
                          onPressed: isCompleted
                              ? null
                              : () async {
                                  String? date = await selectDate();
                                  _endDateCtrl.text = date ?? '';
                                },
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                child: SafeArea(
                  child: Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    // color: Colors.amber,
                    width: MediaQuery.of(context).size.width,
                    child: RoundedRectangleButton(
                      onPressed: onCreateTodo,
                      child: const Text('Create Now'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
