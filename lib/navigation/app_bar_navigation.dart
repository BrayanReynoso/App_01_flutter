import 'package:flutter/material.dart';
import 'package:app_brm_01/modules/home/home.dart';
import 'package:app_brm_01/navigation/profile.dart';
import 'package:app_brm_01/navigation/map_sample.dart';

class AppBarNavigation extends StatefulWidget {
  const AppBarNavigation({super.key});

  @override
  _AppBarNavigationState createState() => _AppBarNavigationState();
}

class _AppBarNavigationState extends State<AppBarNavigation> {
  int _selectedIndex = 0;

  // Lista de widgets que corresponden a las diferentes pantallas
  final List<Widget> _pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const MapSample(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
        ],
      ),
    );
  }
}
