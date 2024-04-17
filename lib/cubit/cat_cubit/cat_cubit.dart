import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/domain/use_case/do_get_cats.dart';
import 'package:catbreeds/domain/use_case/do_get_image_cat.dart';
import 'package:catbreeds/model/cat_image.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final DoGetCats getCatsCall;
  final DoGetImageCat getImageCall;
  CatCubit(this.getCatsCall, this.getImageCall) : super(CatInitial());

  void doGetCats() async {
    emit(CatIsLoading());
    final failureOrCats = await getCatsCall();
    emit(_failureOrCats(failureOrCats));
  }

  Future<CatState> getImage({required String referenceImage}) async {
    final failureOrImage = await getImageCall(referenceImage: referenceImage);
    return _failureOrImageCat(failureOrImage);
  }

  CatState _failureOrCats(Either<Failure, List<CatModel>> failureOrCats) {
    return failureOrCats.fold(
        (failure) => CatError(failure.message), (cats) => GetCatsLoaded(cats));
  }

  CatState _failureOrImageCat(Either<Failure, ImageCat> failureOrImages) {
    return failureOrImages.fold((failure) => CatError(failure.message),
        (image) => GetImageCatLoaded(image));
  }
}
