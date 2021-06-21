import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/weather/WeatherModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'HourlyForecastModel.g.dart';

/**
  * Model for forecast summary in weather module
 */
@JsonSerializable(explicitToJson: true)
class HourlyForecastModel extends BaseModel {
  @JsonKey(name: "dt")
  final int datetime;
  @JsonKey(name: "temp")
  final double temp;
  @JsonKey(name: "feels_like")
  final double feeling;
  @JsonKey(name: "pressure")
  final int pressure;
  @JsonKey(name: "humidity")
  final int humid;
  @JsonKey(name: "wind_speed")
  final double speed;
  @JsonKey(name: "wind_deg")
  final int deg;
  @JsonKey(name: "wind_gust")
  final double gust;
  @JsonKey(name: "visibility")
  final int visibility;
  @JsonKey(name: "clouds")
  final int clouds;
  @JsonKey(name: "uvi")
  final double uvi;
  @JsonKey(name: "weather")
  final List<WeatherModel> weather;

  const HourlyForecastModel({
      this.datetime = 0,
      this.temp = .0,
      this.feeling = .0,
      this.pressure = 0,
      this.humid = 0,
      this.speed = .0,
      this.deg = 0,
      this.gust = .0,
      this.visibility = 0,
      this.clouds = 0,
      this.uvi = .0,
      this.weather = const []

      })
      : super();

  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyForecastModelToJson(this);

  @override
  bool validate() => this.datetime > 0 && this.temp > 0.0 && this.feeling > 0.0 && this.weather.isNotEmpty && this.weather[0].validate();
}
