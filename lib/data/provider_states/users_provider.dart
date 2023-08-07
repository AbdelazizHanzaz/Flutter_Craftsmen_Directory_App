import 'dart:developer';

import 'package:craftsmen_directory_app/data/enums/data_states.dart';
import 'package:craftsmen_directory_app/data/services/json_service.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  List<User> _users = [];
  DataState _dataState = DataState.loading;

  List<User> get users => _users;
  DataState get dataState => _dataState;

  UserProvider(){
    fetchUsers();
  }



  void fetchUsers() async{

     try{
         //simulate data take time
         await Future.delayed(const Duration(seconds: 2));

         _users = await JsonService.getUsers();
         if(_users.isEmpty){
          _dataState = DataState.empty;
         }else{
          _dataState = DataState.loaded;
         }
        notifyListeners();
     }catch(e){
        log("Error fetching users $e");
        _dataState = DataState.error;
        notifyListeners();
     }

  }



}