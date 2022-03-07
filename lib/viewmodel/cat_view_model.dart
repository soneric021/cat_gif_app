import 'package:cat_gif_app/model/base_repository.dart';
import 'package:flutter/cupertino.dart';

import '../di/injection_container.dart';
import '../model/api/api_response.dart';

class CatViewModel with ChangeNotifier {
  BaseRepository _catRepository = sl<BaseRepository>();

  ApiResponse _apiResponse = ApiResponse.initial("Fetching data");

  void setRepository(BaseRepository repo) {
    _catRepository = repo;
  }

  ApiResponse get response {
    return _apiResponse;
  }

  void updateGif() {
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
