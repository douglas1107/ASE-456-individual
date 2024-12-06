import 'package:flutter/material.dart';
import 'firebase_service.dart';

class QueryPage extends StatefulWidget {
  @override
  _QueryPageState createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  List<Map<String, dynamic>> _results = [];
  List<Map<String, dynamic>> _priorityResults = [];

  Future<void> _fetchLogsBetweenDates() async {
    final results = await FirebaseService.fetchLogsBetweenDates(
        _startDateController.text, _endDateController.text);
    setState(() {
      _results = results;
    });
  }

  Future<void> _fetchPriorityLogs() async {
    final results = await FirebaseService.fetchPriorityLogs();
    setState(() {
      _priorityResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Query Logs')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(labelText: 'Start Date (YYYY-MM-DD)'),
            ),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(labelText: 'End Date (YYYY-MM-DD)'),
            ),
            ElevatedButton(
              onPressed: _fetchLogsBetweenDates,
              child: Text('Fetch Logs Between Dates'),
            ),
            Expanded(
              child: _results.isEmpty
                  ? Center(child: Text('No results found.'))
                  : ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final log = _results[index];
                  return Card(
                    child: ListTile(
                      title: Text(log['task']),
                      subtitle: Text(
                          'Date: ${log['date']} | From: ${log['from']} | To: ${log['to']}'),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            ElevatedButton(
              onPressed: _fetchPriorityLogs,
              child: Text('Fetch Priority Logs'),
            ),
            Expanded(
              child: _priorityResults.isEmpty
                  ? Center(child: Text('No priority logs found.'))
                  : ListView.builder(
                itemCount: _priorityResults.length,
                itemBuilder: (context, index) {
                  final log = _priorityResults[index];
                  return Card(
                    child: ListTile(
                      title: Text(log['task']),
                      subtitle:
                      Text('Duration: ${log['duration']} minutes'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
