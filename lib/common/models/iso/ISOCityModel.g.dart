// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ISOCityModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ISOCityModel _$ISOCityModelFromJson(Map<String, dynamic> json) {
  return ISOCityModel(
    code: json['code'] as String,
    name: json['name'] as String,
    img: json['img'] as String,
    geo: json['coords'] == null
        ? null
        : GeolocationModel.fromJson(json['coords'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ISOCityModelToJson(ISOCityModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'img': instance.img,
      'coords': instance.geo?.toJson(),
    };
