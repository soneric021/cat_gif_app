import 'package:cat_gif_app/model/cat.dart';
import 'package:cat_gif_app/model/cat_repository.dart';
import 'package:cat_gif_app/model/services/cat_service.dart';
import 'package:flutter/cupertino.dart';
import "dart:io";

import '../model/api/api_response.dart';

class CatViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial("Fetching data");

  ApiResponse get response {
    return _apiResponse;
  }

  void set() {
    this._apiResponse = ApiResponse.initial("Re fetching data");
    notifyListeners();
  }

  Future<void> fetchCatData() async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      final cat = await CatRepository().fetchCatGift();
      _apiResponse = ApiResponse.completed(cat);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
      print("AQUI");
    }
    notifyListeners();
  }
}
