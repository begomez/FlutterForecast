import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/weather/CountryModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSummaryModel.dart';
import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:flutter_template/common/models/weather/WeatherModel.dart';
import 'package:flutter_template/common/models/weather/WindModel.dart';
import 'package:flutter_template/common/utils/AppDateUtils.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/BaseModel.dart';

part 'ForecastModel.g.dart';

/**
  * Model for single forecast  in weather module
 */
@JsonSerializable(explicitToJson: true)
class ForecastModel extends BaseModel {
  @JsonKey(name: "dt")
  final int datetime;
  @JsonKey(name: "coord")
  final GeolocationModel geo;
  @JsonKey(name: "main")
  final ForecastSummaryModel summary;
  @JsonKey(name: "weather")
  final WeatherModel weather;
  @JsonKey(name: "wind")
  final WindModel wind;
  @JsonKey(name: "sys")
  final CountryModel country;

  const ForecastModel(
      {this.datetime = 0,
      this.geo = const GeolocationModel(),
      this.summary = const ForecastSummaryModel(),
      this.weather,
      this.wind,
      this.country})
      : assert(geo != null),
        assert(summary != null),
        super();

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);

  bool hasWind() => this._hasProp(this.wind);

  bool hasWeather() => this._hasProp(this.weather);

  bool hasCountry() => this._hasProp(this.country);

  String toHourString() =>
      AppDateUtils.millisToHHStr(AppDateUtils.MILIS_PER_SEC * this.datetime);

  bool hasImg() => this.weather.hasIcon();

  String getTemp({bool suffix = true}) => this.summary.getTemp(suffix: suffix);

  bool _hasProp(BaseModel obj) => (obj != null);

  int getInitialOffset() {
    int OFFSET = 1;

    try {
      final hh = int.parse(this.toHourString());

      // NIGHT
      if ((hh >= 0) && (hh < 8)) {
        return -hh * OFFSET;
      } else if ((hh > 8) && (hh < 20)) {
        return hh * OFFSET;
      } else {
        return (1 - hh * OFFSET);
      }
    } on Exception catch (e) {
      return 0;
    }
  }

  @override
  bool validate() {
    return this.geo.validate() && this.summary.validate();
  }
}
