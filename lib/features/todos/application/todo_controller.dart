import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ty2do_flutter_riverpod/features/todos/domain/todo.dart';
import 'package:uuid/uuid.dart';

part 'todo_controller.g.dart';

@riverpod
class TodoController extends _$TodoController {
  final _uuid = const Uuid();

  @override
  List<Todo> build() {
    return [];
  }

  void addTodo(String title) {
    final text = title.trim();

    if (text.isEmpty) return;

    state = [...state, Todo(id: _uuid.v4(), title: text)];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(isDone: !todo.isDone) else todo,
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
