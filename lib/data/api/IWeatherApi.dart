import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/network/response/CurrentWeatherResponse.dart';
import 'package:flutter_template/network/response/ForecastResponse.dart';

/**
 * Abstraction for weather forecast API
 */
abstract class IWeatherApi {
  Future<CurrentWeatherResponse> getCurrentWeatherForLoc(
      ForecastSettingsModel settings);
  Future<ForecastResponse> getForecastForLoc(ForecastSettingsModel settings);
}
