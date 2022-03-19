import 'package:cat_gif_app/model/api/api_response.dart';

import 'Cat.dart';

abstract class BaseRepository {
  Future<Cat> fetchCatGift();
}
