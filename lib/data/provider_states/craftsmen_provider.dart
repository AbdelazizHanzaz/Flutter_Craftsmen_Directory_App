// craftsmen_provider.dart

import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../models/craftsmen.dart';
import '../repositories/craftsmen_repository.dart';
import '../services/json_service.dart';

class CraftsmenProvider with ChangeNotifier {

  final _repository = CraftsmenRepository();

  List<Craftsman> _craftsmen = [];
  bool _isLoading = false;

  List<Craftsman> get craftsmen => _craftsmen;
  bool get isLoading => _isLoading;
  
  

  // Fetch craftsmen
  Future fetchCraftsmen() async {
    _isLoading = true;
    notifyListeners();

    _craftsmen = await _repository.getAllCraftsmen();
    
    _isLoading = false;
    notifyListeners();
  }

  // Search craftsmen
  Future searchCraftsmen(String query) async {
    _isLoading = true;
    notifyListeners();
    
    _craftsmen = await _repository.searchCraftsmen(query);
    
    _isLoading = false;
    notifyListeners();
  }

  // Load sample data from Json file
  Future loadSampleData() async {
    // _isLoading = true;
    //  notifyListeners();
    Future.delayed(Duration(seconds: 500));

    _craftsmen = await JsonService.getCraftsmen();
    log("craftsmen: ${_craftsmen.length}");
    _isLoading = false;
    log("isLoading: $_isLoading");

    notifyListeners();
  }

}

