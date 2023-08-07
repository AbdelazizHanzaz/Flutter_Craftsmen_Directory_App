

import 'dart:developer';

import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final searchTextEditController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return  SearchBar(
           controller: searchTextEditController,
           hintText: "Search: city, service, name",
           //leading: const Icon(Icons.search),
           trailing: [
            searchTextEditController.text.isNotEmpty 
            ? IconButton(onPressed: () => searchTextEditController.clear(), 
            icon: const Icon(Icons.clear)) : Container(),
            IconButton(onPressed: ()=>log(searchTextEditController.text), 
            icon: const Icon(Icons.search))
           ],
           
        );
  }
}