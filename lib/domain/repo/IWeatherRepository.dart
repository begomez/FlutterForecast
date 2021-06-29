import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/common/models/weather/ForecastListModel.dart';

/**
 * Abstraction of forecast weather repo
 */
abstract class IWeatherRepository {
  Future<ForecastListModel> getForecasting(ForecastSettingsModel call);
  Future<ForecastModel> getCurrentWeather(ForecastSettingsModel call);
}
