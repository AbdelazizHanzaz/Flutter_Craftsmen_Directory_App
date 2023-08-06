import 'package:craftsmen_directory_app/provider_states/craftsmen_provider.dart';
import 'package:craftsmen_directory_app/ui/craftsmen/screens/craftsmen_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_) => CraftsmenProvider(),
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Craftsmen Directory App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        //useMaterial3: true,
      ),
      home: const CraftsmenScreen(),
    );
  }
}

