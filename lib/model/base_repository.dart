import 'Cat.dart';

abstract class BaseRepository {
  Future<Cat> fetchCatGift();
}
