import 'dart:math';

import 'package:flutter_template/common/factory/FakeModelFactory.dart';
import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/data/api/IWeatherApi.dart';
import 'package:flutter_template/network/response/CurrentWeatherResponse.dart';
import 'package:flutter_template/network/response/ForecastResponse.dart';

class FakeWeatherApiImpl implements IWeatherApi {
  @override
  Future<ForecastResponse> getForecastForLoc(ForecastSettingsModel call) async {
    return await Future.delayed(Duration(seconds: Random().nextInt(3))).then(
        (value) => ForecastResponse(
            list: FakeModelFactory.hourlyForecasts()));
  }

  @override
  Future<CurrentWeatherResponse> getCurrentWeatherForLoc(
      ForecastSettingsModel settings) async {
    return await Future.delayed(Duration(seconds:2)).then(
        (value) => CurrentWeatherResponse(
            country: FakeModelFactory.country(),
            geo: FakeModelFactory.geo(),
            summary: FakeModelFactory.summary(),
            weather: [FakeModelFactory.weather()],
            wind: FakeModelFactory.wind()));
  }
}
