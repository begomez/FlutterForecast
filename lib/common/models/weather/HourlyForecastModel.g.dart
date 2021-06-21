// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HourlyForecastModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyForecastModel _$HourlyForecastModelFromJson(Map<String, dynamic> json) {
  return HourlyForecastModel(
    datetime: json['dt'] as int,
    temp: (json['temp'] as num)?.toDouble(),
    feeling: (json['feels_like'] as num)?.toDouble(),
    pressure: json['pressure'] as int,
    humid: json['humidity'] as int,
    speed: (json['wind_speed'] as num)?.toDouble(),
    deg: json['wind_deg'] as int,
    gust: (json['wind_gust'] as num)?.toDouble(),
    visibility: json['visibility'] as int,
    clouds: json['clouds'] as int,
    uvi: (json['uvi'] as num)?.toDouble(),
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : WeatherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$HourlyForecastModelToJson(
        HourlyForecastModel instance) =>
    <String, dynamic>{
      'dt': instance.datetime,
      'temp': instance.temp,
      'feels_like': instance.feeling,
      'pressure': instance.pressure,
      'humidity': instance.humid,
      'wind_speed': instance.speed,
      'wind_deg': instance.deg,
      'wind_gust': instance.gust,
      'visibility': instance.visibility,
      'clouds': instance.clouds,
      'uvi': instance.uvi,
      'weather': instance.weather?.map((e) => e?.toJson())?.toList(),
    };
