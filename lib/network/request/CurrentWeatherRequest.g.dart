// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CurrentWeatherRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherRequest _$CurrentWeatherRequestFromJson(
    Map<String, dynamic> json) {
  return CurrentWeatherRequest(
    json['coord'] == null
        ? null
        : GeolocationModel.fromJson(json['coord'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CurrentWeatherRequestToJson(
        CurrentWeatherRequest instance) =>
    <String, dynamic>{
      'coord': instance.geo?.toJson(),
    };
