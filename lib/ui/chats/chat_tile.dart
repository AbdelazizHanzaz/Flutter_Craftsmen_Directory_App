import 'package:flutter/material.dart';

import '../../data/models/chat.dart';

class ChatTile extends StatelessWidget {

  final Chat chat;

  const ChatTile({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(chat.name),
      subtitle: Text(chat.lastMessage),
      trailing: Text(chat.time),
    );
  }

}