

import 'package:flutter/material.dart';

import 'service_card.dart';

class ListServicesWidget extends StatelessWidget {
  const ListServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(6, (index) => ServiceCard(serviceName: "Service ${index+1}", imageIndex: (index+1).toString())),
                //children: craftsman.services.map((service) => ServiceCard(service)).toList(),
              ),
            ),
          );
  }
}