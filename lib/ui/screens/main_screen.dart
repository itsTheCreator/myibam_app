import 'package:flutter/material.dart';
import 'package:myibam_app/ui/widgets/navbar.dart';

import 'home_screen.dart';
import 'profile_screen.dart';
import 'timetable_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex = 0;
  
  // Liste des pages à afficher
  final List<Widget> _pages = [

    const AgendaScreen(),
    const TimetableScreen(),
    const ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: _pages[_currentIndex],
       bottomNavigationBar: NavbarIOS(
        selectedIndex: _currentIndex,
        onTabChange: onTabTapped,
       ),
    );
  }
}