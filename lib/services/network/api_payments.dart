import 'package:detooo_recargas/models/recargas/cards_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:detooo_recargas/utils/constant.dart';
import 'package:detooo_recargas/services/network/dio_instances.dart';

part 'api_payments.g.dart';

@RestApi(baseUrl: API_PAYMENTS)
abstract class ApiPayments {
  factory ApiPayments(Dio dio, {String baseUrl}) = _ApiPayments;

  static ApiPayments common() => ApiPayments(dioCommon());

  @GET("payments/stripe/public_key")
  Future<String> getStripePublicKey();

  @GET("payments/stripe/user_cards")
  Future<UserCards> getStripeUsersCard();

  @GET("payments/stripe/del_user_cards/{pm}")
  Future<void> deleteCard({@Path('pm') String? paymentMethod});
}
