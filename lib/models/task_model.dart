class TaskModel {
  String? id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;
  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dateTime: DateTime.parse(json['dateTime']),
      isDone: json['isDone'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.toString(),
      'isDone': isDone,
    };
  }
}
