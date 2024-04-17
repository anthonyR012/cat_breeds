import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/domain/repository/cat_repository.dart';
import 'package:catbreeds/model/cat_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DoGetImageCat {
  final CatRepository catRepository;
  DoGetImageCat(this.catRepository);

  Future<Either<Failure, ImageCat>> call(
      {required String referenceImage}) async {
    final token = dotenv.env[keyToken] ?? "";
    return await catRepository.getImageCat(
        referenceImage: referenceImage, token: token);
  }
}
