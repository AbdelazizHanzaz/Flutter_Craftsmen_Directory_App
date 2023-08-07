
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int?) onTap;
  const BottomNavBarWidget({super.key, required this.currentIndex, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.teal,
        useLegacyColorScheme: false,
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Craftsmen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      );
  }
}