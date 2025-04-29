import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class menu3 extends StatefulWidget {
  @override
  _Menu3State createState() => _Menu3State();
}

class _Menu3State extends State<menu3> {
  DateTime? selectedDate;
  String result = "";
  Color backgroundColor = Colors.white; // Warna default

  final Map<String, Map<String, int>> neptuTable = {
    "Minggu": {"Legi": 10, "Pahing": 14, "Pon": 12, "Wage": 9, "Kliwon": 13},
    "Senin": {"Legi": 9, "Pahing": 13, "Pon": 11, "Wage": 8, "Kliwon": 12},
    "Selasa": {"Legi": 8, "Pahing": 12, "Pon": 10, "Wage": 7, "Kliwon": 11},
    "Rabu": {"Legi": 12, "Pahing": 16, "Pon": 14, "Wage": 11, "Kliwon": 15},
    "Kamis": {"Legi": 13, "Pahing": 17, "Pon": 15, "Wage": 12, "Kliwon": 16},
    "Jumat": {"Legi": 11, "Pahing": 15, "Pon": 13, "Wage": 10, "Kliwon": 14},
    "Sabtu": {"Legi": 14, "Pahing": 18, "Pon": 16, "Wage": 16, "Kliwon": 17},
  };

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        result = "";
        backgroundColor = Colors.white; // Reset warna saat pilih tanggal baru
      });
    }
  }

  void _calculateDay() {
    if (selectedDate != null) {
      List<String> pasaran = ["Legi", "Pahing", "Pon", "Wage", "Kliwon"];
      List<String> days = ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"];

      int dayOfWeek = selectedDate!.weekday;
      int pasaranIndex = selectedDate!.difference(DateTime(2024, 1, 1)).inDays % 5;

      String dayName = days[dayOfWeek % 7];
      String pasaranName = pasaran[pasaranIndex];
      int neptuValue = neptuTable[dayName]?[pasaranName] ?? 0;

      String kategori;
      Color newBackgroundColor;

      if (neptuValue < 10) {
        kategori = "Jelek";
        newBackgroundColor = Colors.red;
      } else if (neptuValue >= 10 && neptuValue <= 14) {
        kategori = "Baik";
        newBackgroundColor = Colors.yellow;
      } else {
        kategori = "Sangat Baik";
        newBackgroundColor = Colors.green;
      }

      setState(() {
        result = "Hari: $dayName, Pasaran: $pasaranName\nNeptu: $neptuValue ($kategori)";
        backgroundColor = newBackgroundColor; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator Hari Baik')),
      backgroundColor: backgroundColor, // Terapkan warna latar belakang
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            Center(
           child: Padding(
             padding: EdgeInsets.only(top: 200), // Atur naik-turunnya di sini
            child: Text(
           selectedDate == null
             ? "Pilih tanggal"
             : "Tanggal: ${DateFormat('dd MMM yyyy').format(selectedDate!)}",
            style: TextStyle(fontSize: 18),
           textAlign: TextAlign.center,
    ),
  ),
),

SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
            padding: EdgeInsets.only(top: 230), // Tambah jarak ke bawah
            child: ElevatedButton(
            onPressed: _pickDate,
            child: Text("Pilih Tanggal"),
            ),
           ),
           Padding(
           padding: EdgeInsets.only(top: 20), // Ubah sesuai kebutuhan
           child: ElevatedButton(
           onPressed: _calculateDay,
           child: Text("Hitung Hari Baik"),
           ),
           ),

            
          ],
        ),
      ),
    );
  }
}
