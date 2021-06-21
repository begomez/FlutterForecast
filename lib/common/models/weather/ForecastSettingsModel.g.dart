// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForecastSettingsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastSettingsModel _$ForecastSettingsModelFromJson(
    Map<String, dynamic> json) {
  return ForecastSettingsModel(
    city: json['city'] == null
        ? null
        : ISOCityModel.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ForecastSettingsModelToJson(
        ForecastSettingsModel instance) =>
    <String, dynamic>{
      'city': instance.city?.toJson(),
    };
