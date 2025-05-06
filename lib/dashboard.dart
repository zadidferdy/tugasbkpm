import 'package:aplikasibkpm/menu/eskrim.dart';
import 'package:aplikasibkpm/menu/kopi.dart';
import 'package:aplikasibkpm/menu/kue.dart';
import 'package:aplikasibkpm/menu/makanan.dart';
import 'package:aplikasibkpm/menu/minuman.dart';
import 'package:aplikasibkpm/menu/nasi.dart';
import 'package:aplikasibkpm/menu/pizza.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      theme: ThemeData(fontFamily: 'Sans'),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header dan Search Bar
              Container(
                padding: EdgeInsets.all(16),
                color: Color(0xFFBCA07D),
                child: Column(
                  children: [
                    // Search Bar
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari menu...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    // Grid Menu Ikon
                    GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: List.generate(menuItems.length, (index) {
                        final item = menuItems[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => item['form']),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFD6BD9C),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(item['icon'],
                                    size: 28, color: Colors.white),
                                SizedBox(height: 8),
                                Text(
                                  item['label'],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Daftar Produk
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: produkList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 4,
                  ),
                  itemBuilder: (context, index) {
                    final produk = produkList[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFD6BD9C),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar produk
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                              ),
                              child: Image.asset(
                                produk['gambar'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Text("${produk['nama']}\n${produk['harga']}"),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.fastfood, 'label': 'Makanan', 'form': Makanan()},
    {'icon': Icons.local_drink, 'label': 'Minuman', 'form': Minuman()},
    {'icon': Icons.cake, 'label': 'Kue', 'form': Kue()},
    {'icon': Icons.icecream, 'label': 'Es Krim', 'form': EsKrim()},
    {'icon': Icons.rice_bowl, 'label': 'Nasi', 'form': Nasi()},
    {'icon': Icons.local_pizza, 'label': 'Pizza', 'form': Pizza()},
    {'icon': Icons.local_cafe, 'label': 'Kopi', 'form': Kopi()},
    {'icon': Icons.more_horiz, 'label': 'Lainnya'},
  ];
  final List<Map<String, dynamic>> produkList = [
    {'nama': 'Soto', 'harga': 'Rp 12.000', 'gambar': 'images/soto.jpg'},
    {
      'nama': 'Es Serut Pak Pardio',
      'harga': 'Rp 145.000',
      'gambar': 'images/esserut.jpg'
    },
    {
      'nama': 'Nasi Jamblang',
      'harga': 'Rp 20.000',
      'gambar': 'images/nasijamblang.jpg'
    },
    {
      'nama': 'Pizza Bakwan',
      'harga': 'Rp 20.000',
      'gambar': 'images/pizzabakwan.jpg'
    },
    {
      'nama': 'Kopi Vietnam Drip',
      'harga': 'Rp 20.000',
      'gambar': 'images/vietnamdrip.jpg'
    },
    {
      'nama': 'Kue Cubit',
      'harga': 'Rp 20.000',
      'gambar': 'images/kuecubit.jpg'
    },
  ];
}
