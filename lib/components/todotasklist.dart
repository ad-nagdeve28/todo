class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoTaskList() {
    return [
      ToDo(id: '01', todoText: 'Start working on ML', isDone: false),
      ToDo(id: '02', todoText: 'Train the model', isDone: false)
    ];
  }
}
