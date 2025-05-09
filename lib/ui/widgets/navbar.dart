import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class NavbarIOS extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;
  
  const NavbarIOS({super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Hauteur totale incluant le safe area
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, -1),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: const Color.fromARGB(255, 211, 202, 202),
            width: 0.5,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(
            index: 0,
            label: 'Accueil',
            activeIcon: CupertinoIcons.house_fill,
            inactiveIcon: CupertinoIcons.house,
          ),
          _buildTabItem(
            index: 1,
            label: 'Calendrier',
            activeIcon: CupertinoIcons.calendar_today,
            inactiveIcon: CupertinoIcons.calendar,
          ),
          _buildTabItem(
            index: 2,
            label: 'Profil',
            activeIcon: CupertinoIcons.person_fill,
            inactiveIcon: CupertinoIcons.person,
          ),
        ],
      ),
    );
  }
  
  Widget _buildTabItem({
    required int index,
    required String label,
    required IconData activeIcon,
    required IconData inactiveIcon,
  }) {
    final bool isSelected = selectedIndex == index;
    
    // Animation de l'élément sélectionné
    return GestureDetector(
      onTap: () => onTabChange(index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isSelected ? activeIcon : inactiveIcon,
                color: isSelected ? Color(0xFFEF6A4C) : CupertinoColors.systemGrey,
                size: isSelected ? 26 : 24,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected ? Color(0xFFEF6A4C) : CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Exemple d'utilisation:
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Contenu de l\'écran'),
      ),
      bottomNavigationBar: NavbarIOS(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}