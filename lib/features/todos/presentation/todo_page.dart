import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ty2do_flutter_riverpod/features/todos/application/todo_controller.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({super.key});

  @override
  ConsumerState<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openAddTodoSheet() {
    _controller.clear();

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 8,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add a task',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'Capture one thing you want to finish next.',
                style: TextStyle(color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                autofocus: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _addTodo(),
                decoration: const InputDecoration(
                  labelText: 'Todo title',
                  hintText: 'Example: Review pull request',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _addTodo,
                  child: const Text('Add todo'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addTodo() {
    ref.read(todoControllerProvider.notifier).addTodo(_controller.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoControllerProvider);
    final total = todos.length;
    final completed = todos.where((todo) => todo.isDone).length;
    final remaining = total - completed;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ty2Do Riverpod',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Chip(
              label: Text(
                '$remaining open',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          const _BackgroundOrbs(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _HeroCard(
                    total: total,
                    completed: completed,
                    remaining: remaining,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: todos.isEmpty
                        ? _EmptyState(onCreateTodo: _openAddTodoSheet)
                        : ListView.separated(
                            itemCount: todos.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final todo = todos[index];

                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: todo.isDone,
                                        onChanged: (_) {
                                          ref
                                              .read(
                                                todoControllerProvider.notifier,
                                              )
                                              .toggleTodo(todo.id);
                                        },
                                      ),
                                      Expanded(
                                        child: Text(
                                          todo.title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            decoration: todo.isDone
                                                ? TextDecoration.lineThrough
                                                : TextDecoration.none,
                                            color: todo.isDone
                                                ? const Color(0xFF94A3B8)
                                                : const Color(0xFF0F172A),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        tooltip: 'Delete todo',
                                        onPressed: () {
                                          ref
                                              .read(
                                                todoControllerProvider.notifier,
                                              )
                                              .removeTodo(todo.id);
                                        },
                                        icon: const Icon(Icons.delete_outline),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddTodoSheet,
        icon: const Icon(Icons.add),
        label: const Text('Add todo'),
      ),
    );
  }
}

class _BackgroundOrbs extends StatelessWidget {
  const _BackgroundOrbs();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -60,
            right: -40,
            child: _Orb(color: const Color(0x1A4F46E5), size: 180),
          ),
          Positioned(
            top: 150,
            left: -60,
            child: _Orb(color: const Color(0x140EA5E9), size: 150),
          ),
        ],
      ),
    );
  }
}

class _Orb extends StatelessWidget {
  const _Orb({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
          stops: const [0.2, 1],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.total,
    required this.completed,
    required this.remaining,
  });

  final int total;
  final int completed;
  final int remaining;

  @override
  Widget build(BuildContext context) {
    final hasTodos = total > 0;

    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Color(0xFF0F172A), Color(0xFF4F46E5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(
                    Icons.checklist_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 14),
                const Expanded(
                  child: Text(
                    'Plan less. Finish more.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              hasTodos
                  ? 'You have $remaining tasks left and $completed completed.'
                  : 'Start with a small task and build momentum from there.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.86),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                _MetricPill(label: 'Total', value: total.toString()),
                const SizedBox(width: 10),
                _MetricPill(label: 'Done', value: completed.toString()),
                const SizedBox(width: 10),
                _MetricPill(label: 'Open', value: remaining.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onCreateTodo});

  final VoidCallback onCreateTodo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E7FF),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.done_all_rounded,
                    size: 36,
                    color: Color(0xFF4338CA),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Your list is empty',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Add your first todo and turn this into a real workflow.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF64748B), height: 1.4),
                ),
                const SizedBox(height: 18),
                FilledButton(
                  onPressed: onCreateTodo,
                  child: const Text('Create first todo'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
