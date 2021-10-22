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
  Status? status;
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
  Status? status;
  Currencies? currencies;
  Summary? cubacel;
  Summary? nauta;

  factory Recarga.fromJson(Map<String, dynamic> json) =>
      _$RecargaFromJson(json);
  Map<String, dynamic> toJson() => _$RecargaToJson(this);
}
