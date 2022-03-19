part of 'cat_bloc.dart';

@immutable
abstract class CatEvent extends Equatable {
  const CatEvent();
}

class LoadCatEvent extends CatEvent {
  @override
  List<Object?> get props => [];
}
