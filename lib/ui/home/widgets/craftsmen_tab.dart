import 'dart:developer';

import 'package:flutter/material.dart';

import '../../craftsmen/widgets/craftsmen_list.dart';
import '../../shared_widgets/drawer_widget.dart';
import '../../shared_widgets/search_bar.dart';

class CraftsmenTab extends StatelessWidget {
  const CraftsmenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("Craftsmen"),
        actions: [
          IconButton(
            onPressed: ()=> log("more"), 
          icon: const Icon(Icons.more_vert))
        ],
      ),
      body:   const Column(
      children: [
        SearchBarWidget(),
        Expanded(child: CraftsmenList()),
      ],
    )
    );
    
  
  }
}