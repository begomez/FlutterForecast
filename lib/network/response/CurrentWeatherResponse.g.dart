// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CurrentWeatherResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherResponse _$CurrentWeatherResponseFromJson(
    Map<String, dynamic> json) {
  return CurrentWeatherResponse(
    geo: json['coord'] == null
        ? null
        : GeolocationModel.fromJson(json['coord'] as Map<String, dynamic>),
    summary: json['main'] == null
        ? null
        : ForecastSummaryModel.fromJson(json['main'] as Map<String, dynamic>),
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : WeatherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    wind: json['wind'] == null
        ? null
        : WindModel.fromJson(json['wind'] as Map<String, dynamic>),
    country: json['sys'] == null
        ? null
        : CountryModel.fromJson(json['sys'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrentWeatherResponseToJson(
        CurrentWeatherResponse instance) =>
    <String, dynamic>{
      'coord': instance.geo?.toJson(),
      'main': instance.summary?.toJson(),
      'weather': instance.weather?.map((e) => e?.toJson())?.toList(),
      'wind': instance.wind?.toJson(),
      'sys': instance.country?.toJson(),
    };
