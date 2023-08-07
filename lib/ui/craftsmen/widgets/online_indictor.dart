import 'package:flutter/material.dart';

class CraftsmanOnlineIndicator extends StatelessWidget {

  final bool isOnline;

  const CraftsmanOnlineIndicator({super.key, 
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isOnline ? Colors.teal : Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}