import 'package:aplikasibkpm/menu/menu5.dart';
import 'package:aplikasibkpm/menu/menu6.dart';
import 'package:aplikasibkpm/menu/menu7.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aplikasibkpm/menu/menu1.dart';
import 'package:aplikasibkpm/menu/menu2.dart';
import 'package:aplikasibkpm/menu/menu3.dart';
import 'package:aplikasibkpm/menu/menu4.dart';

class dashboard extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': FontAwesomeIcons.book, 'title': 'Acara 5-6', 'route': menu1()},
    {'icon': FontAwesomeIcons.book, 'title': 'Acara 7-8', 'route': menu2()},
    {'icon': FontAwesomeIcons.book, 'title': 'Kalkulator', 'route': menu3()},
    {'icon': FontAwesomeIcons.book, 'title': 'Acara 9-10', 'route': menu4()},
    {'icon': FontAwesomeIcons.book, 'title': 'Acara 13-14', 'route': menu5()},
    {'icon': FontAwesomeIcons.book, 'title': 'Acara 15-16', 'route': menu6()},
    {'icon': FontAwesomeIcons.book, 'title': 'Acara 15-16', 'route': menu7()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashfboard')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => menuItems[index]['route']),
              );
            },
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(menuItems[index]['icon'], size: 50, color: Colors.blue),
                  SizedBox(height: 10),
                  Text(menuItems[index]['title'], style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
