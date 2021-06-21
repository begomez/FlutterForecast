import 'package:flutter_template/common/models/weather/CountryModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSummaryModel.dart';
import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:flutter_template/common/models/weather/WeatherModel.dart';
import 'package:flutter_template/common/models/weather/WindModel.dart';
import 'package:flutter_template/network/response/core/BaseResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CurrentWeatherResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentWeatherResponse extends BaseResponse {
  @JsonKey(name: "coord")
  final GeolocationModel geo;
  @JsonKey(name: "main")
  final ForecastSummaryModel summary;
  @JsonKey(name: "weather")
  final List<WeatherModel> weather;
  @JsonKey(name: "wind")
  final WindModel wind;
  @JsonKey(name: "sys")
  final CountryModel country;

  const CurrentWeatherResponse(
      {this.geo, this.summary, this.weather, this.wind, this.country})
      : super();

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherResponseToJson(this);
}
