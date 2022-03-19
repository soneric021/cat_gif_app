import 'package:cat_gif_app/di/injection_container.dart';
import 'package:cat_gif_app/model/Cat.dart';
import 'package:cat_gif_app/model/base_repository.dart';
import 'package:cat_gif_app/model/retrofit/cat_client.dart';
import 'package:dio/dio.dart';

import '../di/injection_container.dart';

class CatRepository extends BaseRepository {
  late CatClient client = sl<CatClient>();

  @override
  Future<Cat> fetchCatGift() async {
    Cat response = await client.getCatGif();
    return response;
  }
}
