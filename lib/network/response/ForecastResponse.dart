import 'package:flutter_template/common/models/weather/CountryModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:flutter_template/common/models/weather/HourlyForecastModel.dart';
import 'package:flutter_template/network/response/core/BaseResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ForecastResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastResponse extends BaseResponse {
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lon")
  final double lon;
  @JsonKey(name: "timezone")
  final String city;
  @JsonKey(name: "hourly")
  final List<HourlyForecastModel> list;

  const ForecastResponse(
      {this.lat = .0, this.lon = .0, this.city = "", this.list = const []})
      : super();

  factory ForecastResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastResponseToJson(this);
}
