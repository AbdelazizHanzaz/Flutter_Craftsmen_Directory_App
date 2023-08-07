// json_service.dart

import 'dart:convert';

import 'package:craftsmen_directory_app/data/models/service_category.dart';
import 'package:flutter/services.dart';

import '../models/craftsmen.dart';
import '../models/review.dart';
import '../models/user.dart';

class JsonService {

  // Load sample user data
  static Future<List<User>> getUsers() async {
    final jsonData = await _getJson('users.json');
    final list = jsonDecode(jsonData) as List;
    return list.map((e) => User.fromJson(e)).toList();
  }
  
  // Load sample craftsmen data
  static Future<List<Craftsman>> getCraftsmen() async {
    final jsonData = await _getJson('craftsmen.json');
    final data = jsonDecode(jsonData) as List;
    List<Craftsman> list = data.map((e) => Craftsman.fromJson(e)).toList();
    return list;
  }

  // Load sample reviews
  static Future<List<Review>> getReviews() async {
    final jsonString = await _getJson('reviews.json');
    final list = jsonDecode(jsonString) as List;
    return list.map((r) => Review.fromJson(r)).toList();
  }

  //load sample service_categories
  static Future<List<ServiceCategory>> getServiceCategories() async{
     final jsonData = await _getJson('service_categories');
     final list = jsonDecode(jsonData) as List;
     return list.map((e) => ServiceCategory.fromJson(e)).toList();
  }

  // Load JSON file
  static Future<String> _getJson(String fileName) async {
    return await rootBundle.loadString('assets/json/$fileName');
  }

}

