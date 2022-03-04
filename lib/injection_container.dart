import 'package:cat_gif_app/model/base_repository.dart';
import 'package:cat_gif_app/model/cat_repository.dart';
import 'package:cat_gif_app/model/services/base_service.dart';
import 'package:cat_gif_app/model/services/cat_service.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;
void init() {
  sl.registerLazySingleton<BaseRepository>(() => CatRepository());
  sl.registerLazySingleton<BaseService>(() => CatService());
}
