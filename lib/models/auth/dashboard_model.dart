import 'package:json_annotation/json_annotation.dart';

import 'currencies_model.dart';
import 'status_model.dart';
import 'summary_model.dart';

part 'dashboard_model.g.dart';

@JsonSerializable()
class Dashboard {
  Dashboard({
    this.summary,
    this.anuncios,
    this.recargas,
    this.recargadores,
    this.shop,
  });

  @JsonKey(name: 'Summary')
  Summary? summary;
  Anuncios? anuncios;
  Recarga? recargas;
  Recarga? recargadores;
  Anuncios? shop;

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}

@JsonSerializable()
class Anuncios {
  Anuncios({
    this.total,
    this.status,
    this.currencies,
  });

  int? total;
  @JsonKey(name: 'Status')
  Status? status;
  @JsonKey(name: 'Currencies')
  Currencies? currencies;

  factory Anuncios.fromJson(Map<String, dynamic> json) =>
      _$AnunciosFromJson(json);
  Map<String, dynamic> toJson() => _$AnunciosToJson(this);
}

@JsonSerializable()
class Recarga {
  Recarga({
    this.total,
    this.status,
    this.currencies,
    this.cubacel,
    this.nauta,
  });

  int? total;
  @JsonKey(name: 'Status')
  Status? status;
  @JsonKey(name: 'Currencies')
  Currencies? currencies;
  @JsonKey(name: 'Cubacel')
  Summary? cubacel;
  @JsonKey(name: 'Nauta')
  Summary? nauta;

  factory Recarga.fromJson(Map<String, dynamic> json) =>
      _$RecargaFromJson(json);
  Map<String, dynamic> toJson() => _$RecargaToJson(this);
}
