// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForecastResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponse _$ForecastResponseFromJson(Map<String, dynamic> json) {
  return ForecastResponse(
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
    city: json['timezone'] as String,
    list: (json['hourly'] as List)
        ?.map((e) => e == null
            ? null
            : HourlyForecastModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForecastResponseToJson(ForecastResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.city,
      'hourly': instance.list?.map((e) => e?.toJson())?.toList(),
    };
