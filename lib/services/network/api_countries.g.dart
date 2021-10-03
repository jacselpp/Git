// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_countries.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiZTStreaming implements ApiZTStreaming {
  _ApiZTStreaming(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://restcountries.com/v2/all?fields=name,alpha2Code,alpha3Code,callingCodes,flag';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Country>> userRead() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Country>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Country.fromJson(i as Map<String, dynamic>))
        .toList();
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
