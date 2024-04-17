import 'dart:convert';
import 'package:catbreeds/config/constant/end_point_constant.dart';
import 'package:catbreeds/config/constant/http_response_constant.dart';
import 'package:catbreeds/config/functions/status_response_server_function.dart';
import 'package:catbreeds/core/errors/failure_manage.dart';
import 'package:catbreeds/core/errors/failure_messages.dart';
import 'package:catbreeds/data/datasource/cat_datasource.dart';
import 'package:catbreeds/device/connectivity/network_state.dart';
import 'package:catbreeds/model/cat_image.dart';
import 'package:catbreeds/model/cat_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class CatApiDatasourceImplement extends CatDatasource {
  CatApiDatasourceImplement(this._dio, this._network, this.endPoint);
  final Dio _dio;
  final NetworkState _network;
  final CatEndPoint endPoint;

  @override
  Future<List<CatModel>> getCats({required String token}) async {
    throwIfError(
        _network.status == ConnectivityResult.none, failureConnectivity);
    final Options options = Options(headers: {'x-api-key': token});
    final Response response = await _dio
        .get('${endPoint.baseUrl}${endPoint.getCatsUrl}', options: options);
    if (response.statusCode != HTTP_200_OK) {
      readStatusResponseClient(response.statusCode, response.data);
    }
    List<CatModel> cats = catsModelFromJson(jsonEncode(response.data));
    return cats;
  }

  @override
  Future<ImageCat> getImageCat({required String referenceImage,required String token}) async {
    throwIfError(
        _network.status == ConnectivityResult.none, failureConnectivity);
    final Options options = Options(headers: {'x-api-key': token});
    final String fetchUrl = '${endPoint.baseUrl}${endPoint.getImageCatUrl}$referenceImage';
    final Response response = await _dio.get(
        fetchUrl,
        options: options);
    if (response.statusCode != HTTP_200_OK) {
      readStatusResponseClient(response.statusCode, response.data);
    }
    ImageCat image = imageCatFromJson(jsonEncode(response.data));
    return image;
  }
}
