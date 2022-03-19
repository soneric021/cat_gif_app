part of 'cat_bloc.dart';

@immutable
abstract class CatState extends Equatable {}

class CatLoadingState extends CatState {
  @override
  List<Object?> get props => [];
}

class CatCompletedState extends CatState {
  final Cat cat;

  CatCompletedState(this.cat);

  @override
  List<Object?> get props => [cat];
}

class CatErrorState extends CatState {
  final String messageError;

  CatErrorState(this.messageError);

  @override
  // TODO: implement props
  List<Object?> get props => [messageError];
}
