import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svg/heart1.svg'),
          label: '',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ],
    );
  }
}
