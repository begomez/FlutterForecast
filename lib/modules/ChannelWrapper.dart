import 'package:flutter/services.dart';

/**
 * Encapsulation of channel props
 */
abstract class ChannelWrapper {
  static const String PACKAGE = "com.bgomez.flutter_weather";
  static const String SUFFIX = "/openweather";

  static const String GET_CURRENT = "getCurrentWeather";
  static const String GET_FORECAST = "getForecast";

  static MethodChannel create() {
    return MethodChannel("$PACKAGE$SUFFIX");
  }
}
