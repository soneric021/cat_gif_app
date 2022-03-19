import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection_container.dart';
import '../../model/Cat.dart';
import '../../model/base_repository.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final BaseRepository _catRepository = sl<BaseRepository>();

  CatBloc() : super(CatLoadingState()) {
    on<LoadCatEvent>((event, emit) async {
      emit(CatLoadingState());
      try {
        final cat = await _catRepository.fetchCatGift();
        emit(CatCompletedState(cat));
      } catch (e) {
        emit(CatErrorState(e.toString()));
      }
    });
  }
}
