import 'package:flutter/material.dart';

class menu5 extends StatefulWidget {
  const menu5({Key? key}) : super(key: key);

  @override
  State<menu5> createState() => _Menu5PageState();
}

class _Menu5PageState extends State<menu5> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _teleponController = TextEditingController();

  String? nama;
  String? email;
  String? telepon;

  bool isEditing = true;

  void _simpanData() {
    setState(() {
      nama = _namaController.text;
      email = _emailController.text;
      telepon = _teleponController.text;
      isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("✅ Data profil berhasil disimpan")),
    );
  }

  void _editData() {
    setState(() {
      isEditing = true;
      _namaController.text = nama ?? '';
      _emailController.text = email ?? '';
      _teleponController.text = telepon ?? '';
    });
  }

  InputDecoration _inputStyle(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Profil Saya'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: isEditing ? _buildForm() : _buildProfileView(),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10),
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.teal.shade200,
          child: Icon(Icons.person, size: 40, color: Colors.white),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _namaController,
          decoration: _inputStyle("Nama", Icons.person),
        ),
        SizedBox(height: 12),
        TextField(
          controller: _emailController,
          decoration: _inputStyle("Email", Icons.email),
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 12),
        TextField(
          controller: _teleponController,
          decoration: _inputStyle("Telepon", Icons.phone),
          keyboardType: TextInputType.phone,
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: _simpanData,
          icon: Icon(Icons.save),
          label: Text("Simpan"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileView() {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.teal.shade300,
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                SizedBox(height: 16),
                _profileItem("Nama", nama),
                _profileItem("Email", email),
                _profileItem("Telepon", telepon),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: _editData,
          icon: Icon(Icons.edit),
          label: Text("Edit Data"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileItem(String label, String? value) {
    return ListTile(
      leading: Icon(Icons.check_circle_outline, color: Colors.teal),
      title: Text(label),
      subtitle: Text(value ?? '-', style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
