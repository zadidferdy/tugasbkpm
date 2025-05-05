import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Minuman());
}

class Minuman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Minuman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: OrderMinumanPage(),
    );
  }
}

class OrderMinumanPage extends StatefulWidget {
  @override
  _OrderMinumanPageState createState() => _OrderMinumanPageState();
}

class _OrderMinumanPageState extends State<OrderMinumanPage> {
  final TextEditingController _namaController = TextEditingController();
  int _jumlah = 1;

  void _pesanMinuman() {
    String nama = _namaController.text;

    if (nama.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masukkan nama pemesan')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Pesanan Berhasil'),
        content: Text('Terima kasih $nama!\nAnda memesan $_jumlah gelas minuman.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );

    _namaController.clear();
    setState(() {
      _jumlah = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text('Pesan Minuman'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/1046/1046784.png', // ikon minuman
                  height: 100,
                ),
                SizedBox(height: 20),
                Text("Nama Pemesan", style: TextStyle(fontWeight: FontWeight.bold)),
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama Anda',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Jumlah Gelas", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (_jumlah > 1) {
                          setState(() {
                            _jumlah--;
                          });
                        }
                      },
                      icon: Icon(Icons.remove_circle, color: Colors.red),
                    ),
                    Text('$_jumlah', style: TextStyle(fontSize: 20)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _jumlah++;
                        });
                      },
                      icon: Icon(Icons.add_circle, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: _pesanMinuman,
                  icon: Icon(Icons.local_drink),
                  label: Text('Pesan Sekarang'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
