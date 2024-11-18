import 'package:flutter/material.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _students = [
    {'name': 'Ali', 'isPresent': false},
    {'name': 'Budi', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
    {'name': 'Arfira', 'isPresent': false},
    {'name': 'Anggita', 'isPresent': false},
    {'name': 'Risma', 'isPresent': false},
    {'name': 'Mona', 'isPresent': false},
  ];

  final List<Map<String, dynamic>> _history = [];

  List<Map<String, dynamic>> get students => _students;

  List<Map<String, dynamic>> get history => _history;

  void toggleAttendance(int index) {
    _students[index]['isPresent'] = !_students[index]['isPresent'];
    notifyListeners();
  } //mengubah status kehadiran false menjadi true atau sebaliknya

  void saveAttendance() {
    final int presentCount =
        _students.where((s) => s['isPresent']).length; //jumlah siswa yang hadir
    final int absentCount =
        _students.length - presentCount; //jumlah siswa yang tidak hadir

    _history.insert(0, {
      //menambahkan ke history di posisi awal index 0
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    for (var student in _students) {
      student['isPresent'] = false;
    } // mengosongkan status kehadiran setiap siswa setelah data kehadiran berhasil disimpan karena untuk mengatur ulang nilai isPresent setiap siswa menjadi false.

    notifyListeners(); // memanggil agar notifyListeners di perbaharui
  }
}
