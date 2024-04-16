import 'package:catbreeds/model/cat_model.dart';

abstract class CatDatasource {
  Future<List<CatModel>> getCats();
}
