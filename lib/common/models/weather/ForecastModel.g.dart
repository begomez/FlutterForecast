// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForecastModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastModel _$ForecastModelFromJson(Map<String, dynamic> json) {
  return ForecastModel(
    datetime: json['dt'] as int,
    geo: json['coord'] == null
        ? null
        : GeolocationModel.fromJson(json['coord'] as Map<String, dynamic>),
    summary: json['main'] == null
        ? null
        : ForecastSummaryModel.fromJson(json['main'] as Map<String, dynamic>),
    weather: json['weather'] == null
        ? null
        : WeatherModel.fromJson(json['weather'] as Map<String, dynamic>),
    wind: json['wind'] == null
        ? null
        : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
    country: json['sys'] == null
        ? null
        : CountryModel.fromJson(json['sys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastModelToJson(ForecastModel instance) =>
    <String, dynamic>{
      'dt': instance.datetime,
      'coord': instance.geo?.toJson(),
      'main': instance.summary?.toJson(),
      'weather': instance.weather?.toJson(),
      'wind': instance.wind?.toJson(),
      'sys': instance.country?.toJson(),
    };
