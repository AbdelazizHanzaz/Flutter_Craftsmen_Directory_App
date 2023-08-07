

import 'package:craftsmen_directory_app/ui/craftsmen/widgets/cardItem.dart';
import 'package:flutter/material.dart';

class CraftsmenList extends StatelessWidget {
  const CraftsmenList({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index)=> const CraftsmanCard(craftsman: null)
        
        ),
    );
  }
}