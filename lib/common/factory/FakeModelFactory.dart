import 'dart:math';

import 'package:flutter_template/common/models/UserSessionModel.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/CountryModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSummaryModel.dart';
import 'package:flutter_template/common/models/weather/HourlyForecastModel.dart';
import 'package:flutter_template/common/models/weather/WeatherModel.dart';
import 'package:flutter_template/common/models/weather/WindModel.dart';

abstract class FakeModelFactory {
// GENERAL

  static double _randomCelsius() => Random().nextInt(40).toDouble();

  static double _randomSpeed() => Random().nextInt(250).toDouble();

  static int _randomPercent() => Random().nextInt(100);

  static String _randomUserName() => "WeatherForecaster";

  static String _randomEmail() => "forecaster@protonmail.com";

  static String _randomString({int len = 10}) {
    final rand = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => rand.nextInt(33) + 89));
  }

  static bool randomBool() => Random().nextBool();

// FORECAST

  static List<HourlyForecastModel> hourlyForecasts({int num = 24}) =>
      List.generate(num, (index) => _hourlyForecast(index));

  static HourlyForecastModel _hourlyForecast(int pos) =>
      HourlyForecastModel(
        weather: [weather()],
        temp: _randomCelsius(),
        pressure: _randomPercent(),
        datetime: DateTime.now().add(Duration(hours: pos)).millisecondsSinceEpoch,
        humid: _randomPercent(),
        feeling: _randomCelsius(),
        clouds: _randomPercent(),
        deg: _randomPercent(),
        speed: _randomSpeed(),
        visibility: _randomPercent(),
        gust: 0.0,
        uvi: 0.0
      );

  static WindModel wind() => WindModel(speed: _randomSpeed(), deg: _randomPercent(), gust: 1.0);

  static WeatherModel weather() => WeatherModel(
      description: "A lot of clouds", main: "clouds", icon: "04d", id: 1);

  static ForecastSummaryModel summary() => ForecastSummaryModel(
        temp: _randomCelsius(),
        minTemp: _randomCelsius(),
        maxTemp: _randomCelsius(),
        humid: _randomPercent(),
        feeling: _randomCelsius(),
        pressure: _randomPercent(),
      );

  static GeolocationModel geo() =>
      GeolocationModel(lat: 41.390205, lon: 2.154007);

  static CountryModel country() => CountryModel(
        id: 1,
        country: "Spain",
        sunrise: 1568958164,
        sunset: 1568958164,
      );

// SESSION

  static UserSessionModel buildUser() => UserSessionModel(
      name: _randomUserName(), mail: _randomEmail(), token: _randomString());

// ISO

  static ISOCityModel _london() {
    return ISOCityModel(
      code: "lo",
      name: "London",
      img:
          "https://lh5.googleusercontent.com/p/AF1QipOh-giMdOo2Lbc4mHk2R8ixvQLRNGQHPV8E76MV=w408-h256-k-no",
      geo: GeolocationModel(lat: 51.5081157, lon: -0.078138),
    );
  }

  static ISOCityModel _barcelona() {
    return ISOCityModel(
      code: "ba",
      name: "Barcelona",
      img:
          "https://lh5.googleusercontent.com/p/AF1QipOWmCkFjIOWMiiwFoT_FnXIzxOlVRhVQx07Lx2Q=w408-h306-k-no",
      geo: GeolocationModel(lat: 41.4133987, lon: 2.1531554),
    );
  }

  static ISOCityModel _skopje() {
    return ISOCityModel(
      code: "sk",
      name: "Skopje",
      img:
          "https://lh5.googleusercontent.com/p/AF1QipOVqmhxTgEt382BUeZVCbSudmyx-RrjrSEoYwkp=w408-h272-k-no",
      geo: GeolocationModel(lat: 42.0006615, lon: 21.4304344),
    );
  }

  static ISOCityModel _geneva() {
    return ISOCityModel(
      code: "ge",
      name: "Geneva",
      img:
          "https://lh5.googleusercontent.com/p/AF1QipMcoc54Tecqk87ausHr7PfYVo-nsbEONVeKQ1-g=w408-h544-k-no",
      geo: GeolocationModel(lat: 46.1685737, lon: 6.1001757),
    );
  }

  static List<ISOCityModel> isoCities() {
    return [_geneva(), _skopje(), _barcelona(), _london()];
  }
}
