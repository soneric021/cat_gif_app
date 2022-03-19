import 'package:cat_gif_app/model/Cat.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'cat_client.g.dart';

@RestApi(baseUrl: "https://cataas.com")
abstract class CatClient {
  factory CatClient(Dio dio) = _CatClient;

  @GET("/cat/gif?json=true")
  Future<Cat> getCatGif();
}
