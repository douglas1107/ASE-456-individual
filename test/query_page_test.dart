import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw8/query_page.dart';

void main() {
  testWidgets('QueryPage should render a search field and results list',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: QueryPage()));


        await tester.enterText(find.byType(TextField), '');
        await tester.tap(find.text(''));
        await tester.pump();

      });
}
