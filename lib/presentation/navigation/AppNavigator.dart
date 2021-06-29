import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/ForecastListModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/presentation/navigation/Routes.dart';
import 'package:flutter_template/presentation/screens/forecast/ForecastScreen.dart';
import 'package:flutter_template/presentation/screens/weather/WeatherScreen.dart';

abstract class AppNavigator {
  static Future<void> closeAll(BuildContext cntxt) async {
    return SystemNavigator.pop(animated: true);
  }

  static Future<void> toError(BuildContext cntxt) async {
    return Navigator.of(cntxt).pushNamed(Routes.error);
  }

  static Future<void> toForecast(BuildContext cntxt, ISOCityModel place,
      ForecastListModel forecast) async {
    return Navigator.of(cntxt).push(MaterialPageRoute(
        builder: (cntxt) => ForecastScreen(
              place: place,
              forecast: forecast,
            )));
  }

  static Future<void> toCitySelection(BuildContext cntxt) async {
    return Navigator.of(cntxt).pushReplacementNamed(Routes.cities);
  }

  static Future<void> toMain(BuildContext cntxt, ISOCityModel city) async {
    return Navigator.of(cntxt).push(
        MaterialPageRoute(builder: (cntxt) => WeatherScreen(place: city)));
  }
}
