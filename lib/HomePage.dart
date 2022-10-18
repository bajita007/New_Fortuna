import 'package:flutter/material.dart';
import 'package:fortuna/page/BerandaPage.dart';
import 'package:fortuna/page/InvestasiPage.dart';
import 'package:fortuna/page/ProfilePage.dart';
import 'package:fortuna/page/RiwayatPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[
    const BerandaPage(),
    const InvestasiPage(),
    RiwayatPage(),
    Container(),
    const ProfilePage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank_sharp),
              label: 'Investasi',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Riwayat',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_sharp),
              label: 'Team',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Profile',
            backgroundColor: Colors.white


          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
