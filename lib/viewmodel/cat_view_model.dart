import 'package:cat_gif_app/model/base_repository.dart';
import 'package:cat_gif_app/model/cat.dart';
import 'package:cat_gif_app/model/cat_repository.dart';
import 'package:cat_gif_app/model/services/cat_service.dart';
import 'package:flutter/cupertino.dart';
import "dart:io";

import '../injection_container.dart';
import '../model/api/api_response.dart';

class CatViewModel with ChangeNotifier {
  final BaseRepository _catRepository = sl<BaseRepository>();

  ApiResponse _apiResponse = ApiResponse.initial("Fetching data");

  ApiResponse get response {
    return _apiResponse;
  }

  void set() {
    _apiResponse = ApiResponse.initial("Re fetching data");
    notifyListeners();
  }

  Future<void> fetchCatData() async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      final cat = await _catRepository.fetchCatGift();
      _apiResponse = ApiResponse.completed(cat);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }
}
