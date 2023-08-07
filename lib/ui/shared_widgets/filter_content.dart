


import 'package:craftsmen_directory_app/ui/services/widgets/list_services.dart';
import 'package:craftsmen_directory_app/ui/shared_widgets/filter_header.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {

  //List<String> services or cities
  const FilterWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          // Header 
          FilterHeaderWidget(title: "Services"),
          // List of (cities or services)
          ListServicesWidget() //changed leter to pass list of data
        ],
      ),
    );
  }

}
