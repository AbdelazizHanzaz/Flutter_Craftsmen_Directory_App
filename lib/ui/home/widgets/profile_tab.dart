import 'package:flutter/material.dart';

import '../../profile/profile_details.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: const ProfileDetails()
    );
  }
}