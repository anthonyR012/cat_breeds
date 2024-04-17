import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/core/errors/failure_messages.dart';
import 'package:catbreeds/data/datasource/cat_datasource.dart';
import 'package:catbreeds/domain/repository/cat_repository.dart';
import 'package:catbreeds/model/cat_image.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:dartz/dartz.dart';

class CatImplement extends CatRepository {
  final CatDatasource catDatasource;
  CatImplement(this.catDatasource);

  @override
  Future<Either<Failure, List<CatModel>>> getCats() async {
    try {
      List<CatModel> value = await catDatasource.getCats();
      return Right(value);
    } catch (e) {
      if (e is ClientMessage) {
        return Left(ClientMessage(message: e.message));
      } else if (e is ServerMessage) {
        return Left(ServerMessage(message: failureServerUndetected));
      } else {
        return Left(UnknownMesssage(message: e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ImageCat>> getImageCat(
      {required String referenceImage}) async {
    try {
      ImageCat value =
          await catDatasource.getImageCat(referenceImage: referenceImage);
      return Right(value);
    } catch (e) {
      if (e is ClientMessage) {
        return Left(ClientMessage(message: e.message));
      } else if (e is ServerMessage) {
        return Left(ServerMessage(message: failureServerUndetected));
      } else {
        return Left(UnknownMesssage(message: e.toString()));
      }
    }
  }
}
