import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/attendance_provider.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Presensi Siswa')),
      body: ListView.builder(
        //menampilkan daftar siswa
        itemCount: attendanceProvider.students.length,
        itemBuilder: (context, index) {
          final student = attendanceProvider.students[index];
          return ListTile(
            title: Text(student['name']),
            trailing: Checkbox(
              value: student['isPresent'],
              onChanged: (value) {
                attendanceProvider.toggleAttendance(index);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        //tombol untuk menyimpan data kehadiran
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: attendanceProvider.students.isEmpty
              ? null
              : () {
                  attendanceProvider.saveAttendance();
                },
          child: const Text('Simpan Kehadiran'),
        ),
      ),
    );
  }
}
