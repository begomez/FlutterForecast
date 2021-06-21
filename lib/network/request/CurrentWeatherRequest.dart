import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:flutter_template/network/request/core/BaseRequest.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CurrentWeatherRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentWeatherRequest extends BaseRequest {
  @JsonKey(name: "coord")
  final GeolocationModel geo;

  const CurrentWeatherRequest(this.geo) : super();

  factory CurrentWeatherRequest.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherRequestToJson(this);
}
