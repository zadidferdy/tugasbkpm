import 'package:flutter/material.dart';

class menu2 extends StatelessWidget {
  const menu2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ACARA 7-8')),
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
  final TextEditingController namaController = TextEditingController();
  final TextEditingController peranController = TextEditingController();

  String hasil = "Masukkan data dan tekan tombol";

  void prosesLogika() {
    int angka1 = int.tryParse(angka1Controller.text) ?? 0;
    int angka2 = int.tryParse(angka2Controller.text) ?? 0;
    String nama = namaController.text.trim();
    String peran = peranController.text.trim().toLowerCase();

    // While Loop (Menampilkan angka dari angka1 ke angka2)
    String whileLoopResult = "";
    int i = angka1;
    while (i <= angka2) {
      whileLoopResult += "While Loop: Angka ke-$i\n";
      i++;
    }

    // For Loop (Menampilkan angka dari angka1 ke angka2)
    String forLoopResult = "";
    for (int j = angka1; j <= angka2; j++) {
      forLoopResult += "For Loop: Angka ke-$j\n";
    }

    // Mendapatkan hari saat ini
    String hari;
    switch (DateTime.now().weekday) {
      case 1:
        hari = "senin";
        break;
      case 2:
        hari = "selasa";
        break;
      case 3:
        hari = "rabu";
        break;
      case 4:
        hari = "kamis";
        break;
      case 5:
        hari = "jumat";
        break;
      case 6:
        hari = "sabtu";
        break;
      case 7:
        hari = "minggu";
        break;
      default:
        hari = "tidak diketahui";
    }

    // Switch Case - Quotes Berdasarkan Hari
    String quotes;
    switch (hari) {
      case "senin":
        quotes = "Segala sesuatu memiliki kesudahan, yang sudah berakhir biarlah berlalu dan yakinlah semua akan baik-baik saja.";
        break;
      case "selasa":
        quotes = "Setiap detik sangatlah berharga karena waktu mengetahui banyak hal, termasuk rahasia hati.";
        break;
      case "rabu":
        quotes = "Jika kamu tak menemukan buku yang kamu cari di rak, maka tulislah sendiri.";
        break;
      case "kamis":
        quotes = "Jika hatimu banyak merasakan sakit, maka belajarlah dari rasa sakit itu untuk tidak memberikan rasa sakit pada orang lain.";
        break;
      case "jumat":
        quotes = "Hidup tak selamanya tentang pacar.";
        break;
      case "sabtu":
        quotes = "Rumah bukan hanya sebuah tempat, tetapi itu adalah perasaan.";
        break;
      case "minggu":
        quotes = "Hanya seseorang yang takut yang bisa bertindak berani. Tanpa rasa takut itu tidak ada apapun yang bisa disebut berani.";
        break;
      default:
        quotes = "Hari tidak valid.";
    }

    // Ternary Operator - Menentukan angka lebih besar
    String ternaryResult = (angka1 > angka2)
        ? "Angka ke 1 lebih besar"
        : "Angka ke 2 lebih besar";

    // If-Else - Menentukan peran dalam game
    String ifElseResult;
    if (nama.isEmpty) {
      ifElseResult = "Nama harus diisi!";
    } else if (peran.isEmpty) {
      ifElseResult = "Pilih peranmu untuk memulai game";
    } else if (peran == "penyihir") {
      ifElseResult = "Selamat datang $nama, kamu adalah Penyihir!";
    } else if (peran == "guard") {
      ifElseResult = "Selamat datang $nama, kamu adalah Guard!";
    } else if (peran == "werewolf") {
      ifElseResult = "Selamat datang $nama, kamu adalah Werewolf!";
    } else {
      ifElseResult = "Peran tidak dikenal";
    }

    setState(() {
      hasil = "$whileLoopResult\n$forLoopResult\nTernary: $ternaryResult\n$ifElseResult\nQuote hari ini ($hari):\n$quotes";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 128, 17, 213),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: angka1Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelStyle: const TextStyle(color: Colors.white),
              labelText: "Angka 1",
              hintText: "Masukkan angka pertama",
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.person, color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 5, 220, 66), width: 2.0)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5)),
            )
          ),
          const SizedBox(height: 10),
          TextField(
            controller: angka2Controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelStyle: const TextStyle(color: Colors.white),
              labelText: "Angka 2",
              hintText: "Masukkan angka kedua",
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.person, color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 5, 220, 66), width: 2.0)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5)),
            )
          ),
          const SizedBox(height: 10),
          TextField(
            controller: namaController,
            decoration: const InputDecoration(
              labelStyle: const TextStyle(color: Colors.white),
              labelText: "Nama",
              hintText: "Masukkan nama anda",
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.person, color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 5, 220, 66), width: 2.0)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5)),
            )
          ),
          const SizedBox(height: 10),
          TextField(
            controller: peranController,
            decoration: const InputDecoration(
              labelStyle: const TextStyle(color: Colors.white),
              labelText: "Masukkan peran (penyihir, guard, werewolf)",
              hintText: "Masukkan angka kedua",
              hintStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.person, color: Colors.white),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 5, 220, 66), width: 2.0)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2.5)),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: prosesLogika,
            child: const Text("Jalankan Logika"),
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
