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

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
