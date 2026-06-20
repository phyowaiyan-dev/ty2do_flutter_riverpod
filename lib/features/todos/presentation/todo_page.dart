import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ty2do_flutter_riverpod/features/todos/application/todo_controller.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoControllerProvider);
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Ty2Do Riverpod')),

      body: ListView.builder(
        itemCount: todos.length,

        itemBuilder: (context, index) {
          final todo = todos[index];

          return ListTile(
            leading: Checkbox(
              value: todo.isDone,

              onChanged: (_) {
                ref.read(todoControllerProvider.notifier).toggleTodo(todo.id);
              },
            ),

            title: Text(
              todo.title,

              style: TextStyle(
                decoration: todo.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),

            trailing: IconButton(
              icon: const Icon(Icons.delete),

              onPressed: () {
                ref.read(todoControllerProvider.notifier).removeTodo(todo.id);
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,

            builder: (_) => AlertDialog(
              title: const Text('Add Todo'),

              content: TextField(controller: controller, autofocus: true),

              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),

                  child: const Text('Cancel'),
                ),

                FilledButton(
                  onPressed: () {
                    ref
                        .read(todoControllerProvider.notifier)
                        .addTodo(controller.text);

                    Navigator.pop(context);
                  },

                  child: const Text('Add'),
                ),
              ],
            ),
          );
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}
