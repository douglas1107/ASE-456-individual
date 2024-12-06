import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw8/log_time_page.dart';

void main() {
  testWidgets('LogTimePage should render input fields and a submit button',
          (WidgetTester tester) async {
        await tester.pumpWidget(MaterialApp(home: LogTimePage()));

        await tester.enterText(find.byType(TextFormField).at(0), '');
        await tester.enterText(find.byType(TextFormField).at(1), '');
        await tester.enterText(find.byType(TextFormField).at(2), '');
        await tester.enterText(find.byType(TextFormField).at(3), '');
        await tester.enterText(find.byType(TextFormField).at(4), '');

        await tester.tap(find.text('Submit'));
        await tester.pump();

      });
}
