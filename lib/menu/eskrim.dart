import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(EsKrim());
}

class EsKrim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Es Krim',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: OrderEsKrimPage(),
    );
  }
}

class OrderEsKrimPage extends StatefulWidget {
  @override
  _OrderEsKrimPageState createState() => _OrderEsKrimPageState();
}

class _OrderEsKrimPageState extends State<OrderEsKrimPage> {
  final TextEditingController _namaController = TextEditingController();
  int _jumlah = 1;

  void _pesanEsKrim() {
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
        content: Text('Terima kasih $nama!\nAnda memesan $_jumlah cone es krim.'),
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
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: Text('Pesan Es Krim'),
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
                  'https://cdn-icons-png.flaticon.com/512/938/938686.png', // ikon es krim
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
                  child: Text("Jumlah Cone", style: TextStyle(fontWeight: FontWeight.bold)),
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
                      icon: Icon(Icons.add_circle, color: Colors.purple),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: _pesanEsKrim,
                  icon: Icon(Icons.icecream),
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
