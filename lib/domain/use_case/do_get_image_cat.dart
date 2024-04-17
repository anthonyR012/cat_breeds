import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/domain/repository/cat_repository.dart';
import 'package:catbreeds/model/cat_image.dart';
import 'package:dartz/dartz.dart';

class DoGetImageCat {
  final CatRepository catRepository;
  DoGetImageCat(this.catRepository);

  Future<Either<Failure, ImageCat>> call(
      {required String referenceImage}) async {
    return await catRepository.getImageCat(referenceImage: referenceImage);
  }
}
