import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw8/main.dart';

void main() {
  testWidgets('App should navigate between LogTimePage and QueryPage',
          (WidgetTester tester) async {
        await tester.pumpWidget(MyApp());

        expect(find.text('Log Time'), findsOneWidget);
        expect(find.text('Query Logs'), findsOneWidget);

        await tester.tap(find.text('Log Time'));
        await tester.pumpAndSettle();
        expect(find.text('Submit'), findsOneWidget);

        await tester.pageBack();
        await tester.pumpAndSettle();

        await tester.tap(find.text('Query Logs'));
        await tester.pumpAndSettle();
        expect(find.text('Search'), findsOneWidget);
      });
}
