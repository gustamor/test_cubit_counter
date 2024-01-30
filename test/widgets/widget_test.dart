import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_counter_cubit/main.dart';

void main() {
  testWidgets('should display the correct title', (WidgetTester tester) async {
    await tester.pumpWidget(const AiApp());
    expect(find.text('Titulo'), findsOneWidget);
  });

  testWidgets('should display initial counter value as 0',
          (WidgetTester tester) async {
        await tester.pumpWidget(const AiApp());
        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);
      });

  testWidgets('should increment counter when increment button is tapped',
          (WidgetTester tester) async {
        await tester.pumpWidget(const AiApp());
        await tester.tap(find.byKey(const Key('incremented')));
        await tester.pumpAndSettle();
        expect(find.text('0'), findsNothing);
        expect(find.text('1'), findsOneWidget);
      });

  testWidgets('should decrement counter when decrement button is tapped',
          (WidgetTester tester) async {
        await tester.pumpWidget(const AiApp());
        await tester.tap(find.byKey(const Key('incremented')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('decremented')));
        await tester.pumpAndSettle();
        expect(find.text('0'), findsOneWidget);
        expect(find.text('1'), findsNothing);
      });

  testWidgets('exists add and minus buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const AiApp());

    expect(find.byKey(const Key('buttons_row')), findsOneWidget);
    expect(find.byKey(const Key('incremented')), findsOneWidget);
    expect(find.byKey(const Key('decremented')), findsOneWidget);
  });

}
