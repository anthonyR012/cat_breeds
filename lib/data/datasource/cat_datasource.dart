import 'package:catbreeds/model/cat_image.dart';
import 'package:catbreeds/model/cat_model.dart';

abstract class CatDatasource {
  Future<List<CatModel>> getCats({required String token});
  Future<ImageCat> getImageCat(
      {required String referenceImage, required String token});
}
