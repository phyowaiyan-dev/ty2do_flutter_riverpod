import 'package:flutter/material.dart';
import 'package:ty2do_flutter_riverpod/features/todos/presentation/todo_page.dart';

class Ty2DoApp extends StatelessWidget {
  const Ty2DoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ty2Do Riverpod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const TodoPage(),
    );
  }
}