import 'package:flutter/material.dart';


class _Menu4State extends State<menu4> {
  String displayText = ""; // Variabel untuk menyimpan teks yang ditampilkan
  late TextManager textManager; // Objek TextManager

  @override
  void initState() {
    super.initState();
    textManager = SpecialTextManager(); // Menggunakan Polymorphism
    objek(); // Panggil objek saat halaman dimulai
  }

  void objek() {
    setState(() {
      textManager.updateText(); // Mengupdate teks menggunakan objek polymorphic
      displayText = textManager.text; // Menampilkan teks dari TextManager
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu 4")),
      body: Center(
        child: Text(
          displayText, // Menampilkan teks di layar
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}



//class
class TextManager {
  String _text = "Default"; // Variabel private

  String get text => _text; //_merupakan privat dalam dart

  void updateText() {
    _text = "Object dari TextManager"; 
  }
}

//inhertitance & polyrsm
class SpecialTextManager extends TextManager {
  @override
  void updateText() {
    _text = "Object dari SpecialTextManager"; 
  }
}

class menu4 extends StatefulWidget {
  @override
  _Menu4State createState() => _Menu4State();
}
