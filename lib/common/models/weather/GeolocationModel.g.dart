// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GeolocationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeolocationModel _$GeolocationModelFromJson(Map<String, dynamic> json) {
  return GeolocationModel(
    lat: (json['lat'] as num)?.toDouble(),
    lon: (json['lon'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$GeolocationModelToJson(GeolocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
