import 'package:cat_gif_app/model/Cat.dart';
import 'package:cat_gif_app/model/cat_repository.dart';
import 'package:cat_gif_app/model/services/cat_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_cat_gif.mocks.dart';

@GenerateMocks([http.Client])
void main(List<String> args) {
  group('fetchCatGif', () {
    test("returns a cat gif if a http call completes successfully", () async {
      final client = MockClient();
      when(client.get(Uri.parse("https://cataas.com/cat/gif?json=true")).then(
          (_) async => http.Response(
              '{"id":"595f280c557291a9750ebf83","created_at":"2016-09-22T19:11:08.849Z","tags":["jump","file","gif"],"url":"/cat/595f280c557291a9750ebf83"}',
              200)));
      var service = CatRepository();
      expect(await service.fetchCatGift(), isA<Cat>());
    });
  });
}
