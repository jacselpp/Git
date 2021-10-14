// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_recargas.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _APIRecargas implements APIRecargas {
  _APIRecargas(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.v2.recargas.detooo.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Paginated<Item>> readOffers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Paginated<Item>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'packages/filterbydest?dest=recargas',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Paginated<Item>.fromJson(
      _result.data!,
      (json) => Item.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Paginated<Promotions>> readPromotions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Paginated<Promotions>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'promotions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Paginated<Promotions>.fromJson(
      _result.data!,
      (json) => Promotions.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
