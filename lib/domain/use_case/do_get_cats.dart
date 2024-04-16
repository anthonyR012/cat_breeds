import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/domain/repository/cat_repository.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:dartz/dartz.dart';

class DoGetCats {
  final CatRepository catRepository;
  DoGetCats(this.catRepository);

  Future<Either<Failure, List<CatModel>>> call() async {
    return await catRepository.getCats();
  }
}