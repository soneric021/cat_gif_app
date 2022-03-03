import 'package:cat_gif_app/model/Cat.dart';
import 'package:cat_gif_app/model/services/cat_service.dart';

class CatRepository {
  final CatService _catService = CatService();

  Future<Cat> fetchCatGift() async {
    var response = await _catService.getResponse("/cat/gif?json=true");
    Cat jsonData = Cat.fromJson(response);
    return jsonData;
  }
}
