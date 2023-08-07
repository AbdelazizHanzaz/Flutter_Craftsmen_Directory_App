import 'package:flutter/material.dart';

import '../../chats/chats_list.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages"),),
      body:  ChatsList()
    ); 
  }
}