import 'dart:math';

import 'package:flutter_template/common/models/weather/CountryModel.dart';
import 'package:flutter_template/common/models/weather/ForecastListModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSummaryModel.dart';
import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:flutter_template/common/models/weather/WeatherModel.dart';
import 'package:flutter_template/common/models/weather/WindModel.dart';
import 'package:flutter_template/common/utils/AppDateUtils.dart';
import 'package:flutter_template/data/api/IWeatherApi.dart';
import 'package:flutter_template/domain/repo/IWeatherRepository.dart';

class WeatherRepositoryImpl implements IWeatherRepository {
  static final int HOURS_PER_DAY = 24;
  final IWeatherApi _api;

  const WeatherRepositoryImpl(this._api);

  @override
  Future<ForecastListModel> getForecasting(
      ForecastSettingsModel settings) async {
    final resp = await this._api.getForecastForLoc(settings);

    return ForecastListModel(resp.list.map((e) => ForecastModel(
        datetime: e.datetime,
        geo: GeolocationModel(lat: resp.lat, lon: resp.lon),
        weather: e.weather.isEmpty? WeatherModel() : e.weather[0],
        country: const CountryModel(),
        wind: WindModel(speed: e.speed, deg: e.deg, gust: e.gust),
        summary: ForecastSummaryModel(
          feeling: e.feeling,
          humid: e.humid,
          pressure: e.pressure,
          temp: e.temp,
        )
    )
    ).toList().sublist(0, min(resp.list.length, HOURS_PER_DAY)).toList());
  }

  @override
  Future<ForecastModel> getCurrentWeather(
      ForecastSettingsModel settings) async {
    final resp = await this._api.getCurrentWeatherForLoc(settings);

    return ForecastModel(
        datetime: AppDateUtils.nowInMillis(),
        geo: resp.geo,
        summary: resp.summary,
        country: resp.country,
        weather: resp.weather[0],
        wind: resp.wind);
  }
}
