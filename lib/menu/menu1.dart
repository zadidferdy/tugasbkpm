import 'package:flutter/material.dart';

class menu1 extends StatelessWidget {
  const menu1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ACARA 5-6')),
      body: const Center(
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController angka1Controller = TextEditingController();
  final TextEditingController angka2Controller = TextEditingController();
  String hasil = "Masukkan angka dan tekan tombol hitung";

  String helperText1 = "";
  String helperText2 = "";

  void hitung() {
    int angka1 = int.tryParse(angka1Controller.text) ?? 0;
    int angka2 = int.tryParse(angka2Controller.text) ?? 0;

    int hasilTambah = angka1 + angka2;
    int hasilKali = angka1 * angka2;

    String ternaryResult =
        angka1 > angka2 ? "Angka 1 lebih besar" : "Angka 2 lebih besar atau sama";

    String ifElseResult =
        angka1 % 2 == 0 ? "Angka 1 adalah bilangan genap" : "Angka 1 adalah bilangan ganjil";

    String hari;
    switch (hasilTambah) {
      case 3:
      case 10:
      case 17:
      case 24:
        hari = "Senin";
        break;
      case 4:
      case 11:
      case 18:
      case 25:
        hari = "Selasa";
        break;
      case 5:
      case 12:
      case 19:
      case 26:
        hari = "Rabu";
        break;
      case 6:
      case 13:
      case 20:
      case 27:
        hari = "Kamis";
        break;
      case 7:
      case 14:
      case 21:
      case 28:
        hari = "Jumat";
        break;
      case 8:
      case 15:
      case 22:
      case 29:
        hari = "Sabtu";
        break;
      case 2:
      case 9:
      case 16:
      case 23:
        hari = "Minggu";
        break;
      default:
        hari = "Hari tidak diketahui";
    }

    setState(() {
      hasil = "Hasil Tambah: $hasilTambah\n"
          "Hasil Kali: $hasilKali\n"
          "Operator Ternary: $ternaryResult\n"
          "If-Else: $ifElseResult\n"
          "Switch-Case: Hari ini adalah $hari";
    });
  }

  bool _isNumeric(String str) {
    return RegExp(r'^[0-9]+$').hasMatch(str);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 5, 154, 55),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: angka1Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.white),
              labelText: "Angka 1",
              hintText: "Masukkan angka pertama",
              hintStyle: const TextStyle(color: Colors.white),
              helperText: helperText1.isNotEmpty ? helperText1 : null,
              prefixIcon: const Icon(Icons.person, color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 5, 220, 66), width: 2.0)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5)),
            ),
            onChanged: (value) {
              setState(() {
                helperText1 = _isNumeric(value) ? "" : "Harus angka!";
              });
            },
          ),
          const SizedBox(height: 10),
          TextField(
            controller: angka2Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.white),
              labelText: "Angka 2",
              hintText: "Masukkan angka kedua",
              hintStyle: const TextStyle(color: Colors.white),
              helperText: helperText2.isNotEmpty ? helperText2 : null,
              prefixIcon: const Icon(Icons.person, color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 5, 220, 66), width: 2.0)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5)),
            ),
            onChanged: (value) {
              setState(() {
                helperText2 = _isNumeric(value) ? "" : "Harus angka!";
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: hitung,
            child: const Text("Hitung"),
          ),
          const SizedBox(height: 20),
          Text(
            hasil,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
