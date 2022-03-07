import 'package:cat_gif_app/di/injection_container.dart';
import 'package:cat_gif_app/model/Cat.dart';
import 'package:cat_gif_app/model/base_repository.dart';
import 'package:cat_gif_app/model/services/base_service.dart';

import '../di/injection_container.dart';

class CatRepository extends BaseRepository {
  final BaseService _catService = sl<BaseService>();

  @override
  Future<Cat> fetchCatGift() async {
    var response = await _catService.getResponse("/cat/gif?json=true");
    Cat jsonData = Cat.fromJson(response);
    return jsonData;
  }
}
