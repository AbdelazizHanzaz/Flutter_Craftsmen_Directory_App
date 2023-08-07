import 'dart:developer';

import 'package:craftsmen_directory_app/ui/shared_widgets/bottom_nav_bar.dart';
import 'package:craftsmen_directory_app/ui/shared_widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/calls_tab.dart';
import 'widgets/chats_tab.dart';
import 'widgets/craftsmen_tab.dart';
import 'widgets/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const CraftsmenTab(),
    const ChatsTab(),
    const CallsTab(),
    const ProfileTab(), 
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: _tabs[_selectedIndex],
      ),
      bottomNavigationBar:  BottomNavBarWidget(
        currentIndex: _selectedIndex,
        onTap: (index){
          setState(() {
            _selectedIndex = index!;
          });
        },
        )
    );

  }

}