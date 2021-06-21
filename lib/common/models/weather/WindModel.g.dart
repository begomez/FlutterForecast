// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WindModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindModel _$WindModelFromJson(Map<String, dynamic> json) {
  return WindModel(
    speed: (json['speed'] as num)?.toDouble(),
    deg: json['deg'] as int,
    gust: (json['gust'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$WindModelToJson(WindModel instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };
