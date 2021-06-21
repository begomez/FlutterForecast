import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/common/utils/AppLogger.dart';
import 'package:flutter_template/data/api/IWeatherApi.dart';
import 'package:flutter_template/modules/ChannelWrapper.dart';
import 'package:flutter_template/network/response/CurrentWeatherResponse.dart';
import 'package:flutter_template/network/response/ForecastResponse.dart';

const String TAG = "WeatherApiImpl";

class WeatherApiImpl implements IWeatherApi {
  const WeatherApiImpl();

  @override
  Future<ForecastResponse> getForecastForLoc(
      ForecastSettingsModel settings) async {
    try {
      final json = await ChannelWrapper.create()
          .invokeMethod(ChannelWrapper.GET_FORECAST, {
        "lat": settings.city.geo.lat,
        "lon": settings.city.geo.lon,
        "appId": settings.appId
      });

      AppLogger.i(tag: TAG, msg: json);

      return _decodeForecastAsync(json);
    } on PlatformException catch (pe) {
      AppLogger.e(tag: TAG, msg: "getForecast($pe)", error: pe);
    } on Exception catch (e) {
      AppLogger.e(tag: TAG, msg: "getForecast($e)", error: e);
    }
  }

  @override
  Future<CurrentWeatherResponse> getCurrentWeatherForLoc(
      ForecastSettingsModel settings) async {
    try {
      final json = await ChannelWrapper.create()
          .invokeMethod(ChannelWrapper.GET_CURRENT, {
        "lat": settings.city.geo.lat,
        "lon": settings.city.geo.lon,
        "appId": settings.appId
      });

      AppLogger.i(tag: TAG, msg: json);

      return _decodeCurrentAsync(json);
    } on PlatformException catch (pe) {
      AppLogger.e(tag: TAG, msg: "getCurrentWeather($pe)", error: pe);
    } on Exception catch (e) {
      AppLogger.e(tag: TAG, msg: "getCurrentWeather($e)", error: e);
    }
  }
}

Future<ForecastResponse> _decodeForecastAsync(String str) async {
  final res = await compute(jsonDecode, str);

  return forecastInstanceCreator(res);
}

ForecastResponse forecastInstanceCreator(Map<String, dynamic> json) {
  return ForecastResponse.fromJson(json);
}

Future<CurrentWeatherResponse> _decodeCurrentAsync(String str) async {
  final res = await compute(jsonDecode, str);

  return currentInstanceCreator(res);
}

CurrentWeatherResponse currentInstanceCreator(Map<String, dynamic> json) {
  return CurrentWeatherResponse.fromJson(json);
}
