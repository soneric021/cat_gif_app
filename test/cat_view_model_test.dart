import 'package:cat_gif_app/injection_container.dart';
import 'package:cat_gif_app/model/Cat.dart';
import 'package:cat_gif_app/model/api/api_response.dart';
import 'package:cat_gif_app/model/base_repository.dart';
import 'package:cat_gif_app/viewmodel/cat_view_model.dart';
import 'package:test/test.dart';

class MockRepository extends BaseRepository {
  @override
  Future<Cat> fetchCatGift() async {
    return Future.value(Cat(id: "", createdAt: "", tags: [], url: ""));
  }
}

void main() {
  group('Fetch Cat Gif', () {
    init();
    var catViewModel = CatViewModel();
    test('when call fetch cat data return an instance of Cat', () async {
      // 1
      catViewModel.setRepository(MockRepository());
      expect(catViewModel.response.status, Status.INITIAL);
      // 2
      await catViewModel.fetchCatData();
      // 3
      expect(catViewModel.response.data, isA<Cat>());
      expect(catViewModel.response.status, Status.COMPLETED);

      catViewModel.updateGif();
      expect(catViewModel.response.status, Status.INITIAL);
    });
  });
}
