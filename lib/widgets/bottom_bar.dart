import 'package:flutter/material.dart';
import 'package:flutter_app_1/screens/histiory_screen.dart';
import 'package:flutter_app_1/screens/home_screen.dart';
import 'package:flutter_app_1/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    ProfileScreen(),
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
            icon: Icon(
              Icons.home,
              size: 35,
            ),
            label: 'ໜ້າຫຼັກ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: 35,
            ),
            label: 'ປະຫວັດ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 35,
            ),
            label: 'ສ່ວນຕົວ',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue[900],
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
