import 'package:craftsmen_directory_app/provider_states/craftsmen_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CraftsmenScreen extends StatelessWidget {
  const CraftsmenScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final craftsmenProvider = Provider.of<CraftsmenProvider>(context, listen: false);
    craftsmenProvider.loadSampleData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Craftsmen"),
        centerTitle: true,
      ),
      body: Center(
        child: craftsmenProvider.isLoading 
        ? const CircularProgressIndicator() 
        : Text("Craftsmen : ${craftsmenProvider.craftsmen.length}"),
      ),
    );
  }
}