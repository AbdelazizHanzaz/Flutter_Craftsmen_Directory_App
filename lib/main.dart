import 'package:craftsmen_directory_app/data/provider_states/craftsmen_provider.dart';
import 'package:craftsmen_directory_app/data/provider_states/loading_provider.dart';
import 'package:craftsmen_directory_app/data/provider_states/users_provider.dart';
import 'package:craftsmen_directory_app/ui/craftsmen/screens/craftsmen_screen.dart';
import 'package:craftsmen_directory_app/ui/craftsmen/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (_) => UserProvider(),
    child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Craftsmen Directory App',
      theme: ThemeData(
        primaryColor: Colors.teal[300],
        primarySwatch: Colors.teal
        //colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 3, 115, 104)),
        //useMaterial3: true,
      ),
      home: const CraftsmenScreen(),
    );
  }
}

