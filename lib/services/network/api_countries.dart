import 'package:detooo_recargas/models/auth/countries_model.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_countries.g.dart';

@RestApi(baseUrl: API_COUNTRIES)
abstract class ApiZTStreaming {
  factory ApiZTStreaming(Dio dio, {String baseUrl}) = _ApiZTStreaming;

  static ApiZTStreaming common() => ApiZTStreaming(dioCommon());

  @GET("")
  Future<List<Country>> userRead();
}
