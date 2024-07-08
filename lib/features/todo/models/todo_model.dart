class Todo {
  String id;
  String title;
  String startDate;
  String endDate;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    this.isCompleted = false,
  });
}
