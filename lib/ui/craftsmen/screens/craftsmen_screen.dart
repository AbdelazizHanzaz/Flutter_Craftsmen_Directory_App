import 'dart:developer';

import 'package:craftsmen_directory_app/ui/craftsmen/widgets/cardItem.dart';
import 'package:craftsmen_directory_app/ui/craftsmen/widgets/craftsmen_list.dart';
import 'package:craftsmen_directory_app/ui/shared_widgets/filter_content.dart';
import 'package:flutter/material.dart';

class CraftsmenScreen extends StatelessWidget {
  const CraftsmenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => log("search"), icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () => log("search"),
              icon: const Icon(Icons.more_vert)),
        ],
        title: const Text(
          "Craftsmen",
          style: TextStyle(
              fontSize: 24,
              shadows: [Shadow(offset: Offset(2, 3), color: Colors.black45)],
              fontWeight: FontWeight.bold),
        ),
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, val) {
            return [
              const SliverAppBar(
                expandedHeight: 180,
                collapsedHeight: 170,
                pinned: false,
                floating: true,
                flexibleSpace: FilterWidget(),
                elevation: 4,
                // actions: [
                //   Text("Services listview here")

                // ],
              )
            ];
          },
          body: const CraftsmenList()),
    );
  }
}
