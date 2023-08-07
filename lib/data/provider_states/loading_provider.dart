import 'package:flutter/foundation.dart';

class LoadingProvider extends ChangeNotifier {
  bool isLoading = true;

  Future fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
  }
}