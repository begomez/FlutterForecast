import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'WindModel.g.dart';

/**
 * Model for mapping in OpenWeather api
 */
@JsonSerializable(explicitToJson: true)
class WindModel extends BaseModel {
  @JsonKey(name: "speed")
  final double speed;

  @JsonKey(name: "deg")
  final int deg;

  @JsonKey(name: "gust")
  final double gust;

  const WindModel({this.speed, this.deg, this.gust});

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);

  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}
