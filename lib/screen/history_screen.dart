import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/attendance_provider.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<AttendanceProvider>(context)
        .history; //mengakses data history dari file attendance_provider yang berisi riwayat  kehadiran siswa

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final record = history[index];
          return ListTile(
            title: Text(DateFormat('dd MMM yyyy').format(record['date'])),
            subtitle: Text(
              'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
            ),
          );
        },
      ),
    );
  }
}
