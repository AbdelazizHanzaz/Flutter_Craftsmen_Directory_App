import 'package:flutter/material.dart';

import '../../calls/calls_list.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Call History"),
        ),
        body: CallsList());
  }
}
