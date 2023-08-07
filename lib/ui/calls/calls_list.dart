import 'package:flutter/material.dart';

import '../../data/models/call.dart';
import 'call_tile.dart';

class CallsList extends StatelessWidget {

  final List<Call> calls = [
    Call(
      name: 'John Doe',
      time: '5m ago',
      isIncoming: true,
    ),
    Call(
      name: 'Jane Smith',
      time: 'Yesterday',
      isIncoming: false,
    ),
  ];

  CallsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        return CallTile(call: calls[index]);
      }
    );
  }

}



