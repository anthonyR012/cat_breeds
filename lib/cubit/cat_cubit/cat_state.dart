part of 'cat_cubit.dart';

sealed class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

final class CatInitial extends CatState {}

final class CatIsLoading extends CatState {}

final class CatError extends CatState {
  final String message;

  const CatError(this.message);
  @override
  List<Object> get props => [message];
}

class GetCatsLoaded extends CatState {
  final List<CatModel> cats;

  const GetCatsLoaded(this.cats);

  @override
  List<Object> get props => [cats];
}

class GetImageCatLoaded extends CatState {
  final ImageCat image;
  const GetImageCatLoaded(this.image);

  @override
  List<Object> get props => [image];
}
