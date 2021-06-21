// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForecastSummaryModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastSummaryModel _$ForecastSummaryModelFromJson(Map<String, dynamic> json) {
  return ForecastSummaryModel(
    temp: (json['temp'] as num)?.toDouble(),
    feeling: (json['feels_like'] as num)?.toDouble(),
    minTemp: (json['temp_min'] as num)?.toDouble(),
    maxTemp: (json['temp_max'] as num)?.toDouble(),
    pressure: json['pressure'] as int,
    humid: json['humidity'] as int,
  );
}

Map<String, dynamic> _$ForecastSummaryModelToJson(
        ForecastSummaryModel instance) =>
    <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feeling,
      'temp_min': instance.minTemp,
      'temp_max': instance.maxTemp,
      'pressure': instance.pressure,
      'humidity': instance.humid,
    };
