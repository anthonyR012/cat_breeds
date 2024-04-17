import 'package:catbreeds/model/cat_image.dart';
import 'package:catbreeds/model/cat_model.dart';

abstract class CatDatasource {
  Future<List<CatModel>> getCats();
  Future<ImageCat> getImageCat({required String referenceImage});
}
