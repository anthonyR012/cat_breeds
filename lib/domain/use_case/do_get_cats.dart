import 'package:catbreeds/config/constant/string_constant.dart';
import 'package:catbreeds/core/errors/failure.dart';
import 'package:catbreeds/domain/repository/cat_repository.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DoGetCats {
  final CatRepository catRepository;
  DoGetCats(this.catRepository);

  Future<Either<Failure, List<CatModel>>> call() async {
    final token = dotenv.env[keyToken] ?? "";
    return await catRepository.getCats(token: token);
  }
}
