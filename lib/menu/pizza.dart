import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Pizza());
}

class Pizza extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Flutter',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: OrderPizzaPage(),
    );
  }
}

class OrderPizzaPage extends StatefulWidget {
  @override
  _OrderPizzaPageState createState() => _OrderPizzaPageState();
}

class _OrderPizzaPageState extends State<OrderPizzaPage> {
  final TextEditingController _namaController = TextEditingController();
  String _ukuran = 'Medium';
  int _jumlah = 1;

  void _pesanPizza() {
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
        content: Text(
            'Terima kasih $nama!\nAnda memesan $_jumlah Pizza ukuran $_ukuran.'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );

    // Reset form
    _namaController.clear();
    setState(() {
      _ukuran = 'Medium';
      _jumlah = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        title: Text('Pesan Pizza'),
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
                  'https://cdn-icons-png.flaticon.com/512/3595/3595455.png',
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
                  child: Text("Pilih Ukuran Pizza", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 5),
                DropdownButtonFormField<String>(
                  value: _ukuran,
                  items: ['Small', 'Medium', 'Large']
                      .map((uk) => DropdownMenuItem(
                            value: uk,
                            child: Text(uk),
                          ))
                      .toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _ukuran = value!;
                    });
                  },
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Jumlah", style: TextStyle(fontWeight: FontWeight.bold)),
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
                      icon: Icon(Icons.add_circle, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: _pesanPizza,
                  icon: Icon(Icons.shopping_cart_checkout),
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
