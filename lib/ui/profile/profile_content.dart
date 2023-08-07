import 'package:flutter/material.dart';

import 'profile_item.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});


  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileItem(title: 'Email', value: 'john@doe.com'),
        ProfileItem(title: 'Phone', value: '555-1234'),
        ProfileItem(title: 'Location', value: 'New York, NY'),
      ],
    );
  }

}