import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/model/cat_image.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, List<CatModel>>> getCats({required String token});
  Future<Either<Failure, ImageCat>> getImageCat(
      {required String referenceImage, required String token});
}
