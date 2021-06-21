import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ISOCityModel.g.dart';

/**
 * Model for single city configured according to ISO 3166 country codes
 */
@JsonSerializable(explicitToJson: true)
class ISOCityModel extends BaseModel {
  @JsonKey(name: "code")
  final String code;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "img")
  final String img;
  @JsonKey(name: "coords")
  final GeolocationModel geo;

  const ISOCityModel(
      {this.code = "",
      this.name = "",
      this.img = "",
      this.geo = const GeolocationModel()})
      : super();

  ISOCityModel copyWith({String code, String name, String img, GeolocationModel geo}) =>
      ISOCityModel(code: code ?? this.code, img: img?? this.img, name: name?? this.name, geo: geo?? this.geo);

  factory ISOCityModel.fromJson(Map<String, dynamic> json) =>
      _$ISOCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ISOCityModelToJson(this);

  bool hasImage() => this.img.isNotEmpty;

  @override
  bool validate() {
    return code.isNotEmpty && name.isNotEmpty;
  }

  @override
  String toString() => this.name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ISOCityModel &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name &&
          img == other.img &&
          geo == other.geo;

  @override
  int get hashCode =>
      code.hashCode ^ name.hashCode ^ img.hashCode ^ geo.hashCode;
}
