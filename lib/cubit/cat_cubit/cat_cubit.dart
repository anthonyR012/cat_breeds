import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/domain/use_case/do_get_cats.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  final DoGetCats getCatsCall;
  CatCubit(this.getCatsCall) : super(CatInitial());

  void doGetCats() async {
    emit(CatIsLoading());
    final failureOrServices = await getCatsCall();
    emit(_failureOrCats(failureOrServices));
  }

  CatState _failureOrCats(Either<Failure, List<CatModel>> failureOrCats) {
    return failureOrCats.fold(
        (failure) => CatError(failure.message), (cats) => GetCatsLoaded(cats));
  }
}
