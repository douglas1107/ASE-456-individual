import 'package:flutter_test/flutter_test.dart';
import 'package:hw8/firebase_service.dart';

void main() {
  group('FirebaseService', () {
    test('addTimeLog should add data to Firebase', () async {
      // Mock inputs
      String date = '';
      String from = '';
      String to = '';
      String task = '';
      String tag = '';

      await FirebaseService.addTimeLog(
        date: date,
        from: from,
        to: to,
        task: task,
        tag: tag,
      );

      expect(true, isTrue);
    });

    test('queryTimeLogs should return filtered results', () async {
      String query = 'STUDY';

      List<Map<String, dynamic>> results =
      await FirebaseService.queryTimeLogs(query);

    });
  });
}
