import 'package:detooo_recargas/models/recargas/promotions_model.dart';
import 'package:detooo_recargas/models/recargas/testimonials_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:detooo_recargas/models/recargas/package_model.dart';
import 'package:detooo_recargas/models/recargas/paginated_model.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';
import 'package:detooo_recargas/utils/constant.dart';

part 'api_recargas.g.dart';

@RestApi(baseUrl: API_RECARGAS)
abstract class APIRecargas {
  factory APIRecargas(Dio dio, {String baseUrl}) = _APIRecargas;

  static APIRecargas common() => APIRecargas(dioCommon());

  @GET("packages/filterbydest?dest=recargas")
  Future<Paginated<Item>> readOffers();

  @GET("promotions")
  Future<List<Promotions>> readPromotions();

  @GET("testimonials/list")
  Future<List<Testimonials>> fetchTestimonials();

  @POST("testimonials")
  Future<void> createTestimonials(@Body() Testimonials testimonials);
}
