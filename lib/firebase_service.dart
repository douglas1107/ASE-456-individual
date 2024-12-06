import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class FirebaseService {
  static final DatabaseReference _db = FirebaseDatabase.instance.ref();

  static Future<void> addTimeLog({
    required String date,
    required String from,
    required String to,
    required String task,
    required String tag,
  }) async {
    await _db.child('time_logs').push().set({
      'date': date,
      'from': from,
      'to': to,
      'task': task,
      'tag': tag,
    });
  }

  static Future<List<Map<String, dynamic>>> fetchLogsBetweenDates(
      String startDate, String endDate) async {
    final snapshot = await _db.child('time_logs').get();
    if (snapshot.exists) {
      final rawData = snapshot.value as Map<dynamic, dynamic>;
      return rawData.entries
          .map((entry) => {
        'id': entry.key,
        ...Map<String, dynamic>.from(entry.value),
      })
          .where((log) =>
      log['date'].compareTo(startDate) >= 0 &&
          log['date'].compareTo(endDate) <= 0)
          .toList();
    } else {
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> fetchPriorityLogs() async {
    final snapshot = await _db.child('time_logs').get();
    if (snapshot.exists) {
      final rawData = snapshot.value as Map<dynamic, dynamic>;
      final logs = rawData.entries.map((entry) {
        final data = Map<String, dynamic>.from(entry.value);
        final from = TimeOfDayExtension.parse(data['from']);
        final to = TimeOfDayExtension.parse(data['to']);
        final duration = to.difference(from).inMinutes;
        return {
          'id': entry.key,
          'task': data['task'],
          'duration': duration,
          ...data,
        };
      }).toList();

      logs.sort((a, b) => b['duration'].compareTo(a['duration']));
      return logs;
    } else {
      return [];
    }
  }
}

extension TimeOfDayExtension on TimeOfDay {
static TimeOfDay parse(String time) {
final parts = time.split(RegExp('[: ]'));
final hour = int.parse(parts[0]);
final minute = int.parse(parts[1]);
final isPM = parts[2].toUpperCase() == 'PM';
return TimeOfDay(
hour: isPM && hour != 12 ? hour + 12 : (hour == 12 && !isPM ? 0 : hour),
minute: minute,
);
}

Duration difference(TimeOfDay other) {
final thisMinutes = hour * 60 + minute;
final otherMinutes = other.hour * 60 + other.minute;
return Duration(minutes: thisMinutes - otherMinutes);
}
}