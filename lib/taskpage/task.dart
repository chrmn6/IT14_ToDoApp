class Task {
  String title;
  String note;
  String dateTime;
  String category;
  bool isCompleted;

  Task({
    required this.title,
    required this.note,
    required this.dateTime,
    required this.category,
    this.isCompleted = false,
  });

  Task copyWith({
    String? title,
    String? note,
    String? category,
    bool? isCompleted,
    String? dateTime,
  }) {
    return Task(
      title: title ?? this.title,
      note: note ?? this.note,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
