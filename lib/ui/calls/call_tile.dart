import 'package:flutter/material.dart';

import '../../data/models/call.dart';

class CallTile extends StatelessWidget {

  final Call call;

  const CallTile({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: Text(call.name),
      trailing: call.isIncoming ? const Icon(Icons.call_received) : const Icon(Icons.call_made),
      subtitle: Text(call.time),
    );
  }

}