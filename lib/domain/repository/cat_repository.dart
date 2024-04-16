
import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, List<CatModel>>> getCats();
}
