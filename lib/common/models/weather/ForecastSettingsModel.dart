import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:flutter_template/presentation/Constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ForecastSettingsModel.g.dart';

/**
 * Model to encapsulate inner config about a place whose forecast we want to query
 */
@JsonSerializable(explicitToJson: true)
class ForecastSettingsModel extends BaseModel {
  @JsonKey(name: "city")
  final ISOCityModel city;

  @JsonKey(name: "appid")
  final String appId = Constants.WEATHER_API_KEY;

  const ForecastSettingsModel({this.city});

  factory ForecastSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastSettingsModelToJson(this);
}
