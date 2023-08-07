import 'package:flutter/material.dart';

import '../../data/models/chat.dart';
import 'chat_tile.dart';

class ChatsList extends StatelessWidget {

  final List<Chat> chats = [
    Chat(
      name: 'John Doe',
      lastMessage: 'Hi, I need a plumber ASAP. Are you available?',
      time: '5m ago'
    ),
    Chat(
      name: 'Jane Smith',
      lastMessage: 'Thanks for the great work!',
      time: 'Yesterday'       
    ),
  ];

  ChatsList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ChatTile(chat: chats[index]);
      } 
    );
  }

}



