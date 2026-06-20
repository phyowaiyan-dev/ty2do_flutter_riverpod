import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ty2do_flutter_riverpod/app.dart';

void main() {
  runApp(
    const ProviderScope(child: Ty2DoApp(),),
  );
}