import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ty2do_flutter_riverpod/app.dart';

void main() {
  testWidgets('app boots with the todo home screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: Ty2DoApp()));
    await tester.pumpAndSettle();

    expect(find.text('Ty2Do Riverpod'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
