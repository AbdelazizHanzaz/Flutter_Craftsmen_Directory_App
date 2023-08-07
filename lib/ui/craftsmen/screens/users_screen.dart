import 'package:craftsmen_directory_app/data/enums/data_states.dart';
import 'package:craftsmen_directory_app/data/provider_states/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Screen"),
      ),
      body: Center(
        child: Consumer<UserProvider>(
          builder: (context, provider, _){
              if(provider.dataState == DataState.loading){
                return const CircularProgressIndicator();
              }else if(provider.dataState == DataState.empty){
                return const Text("Empty List");
              }else if(provider.dataState == DataState.error){
                 return const Text("Something went wrong try again");
              }
              return Text("Users : ${provider.users.length}");
          },
        ),
      ),
    );
  }
}