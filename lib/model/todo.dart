 class Todo{
  String? id;
  String? todo;
  bool isd;
  Todo({
    required this.id,
    required this.todo,
    this.isd = false
  });
  static List<Todo> TodoList ()
  {
    return [
      Todo(id: '01', todo: 'do this', isd: true),
      Todo(id: '02', todo: 'do that', isd: true),
      Todo(id: '03', todo: 'dentist'),
      Todo(id: '04', todo: 'cook the food'),
      Todo(id: '05', todo: 'enjoy life'),
    ];
 }
 }