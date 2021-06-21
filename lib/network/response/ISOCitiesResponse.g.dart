// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ISOCitiesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ISOCitiesResponse _$ISOCitiesResponseFromJson(Map<String, dynamic> json) {
  return ISOCitiesResponse(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : ISOCityModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ISOCitiesResponseToJson(ISOCitiesResponse instance) =>
    <String, dynamic>{
      'list': instance.list?.map((e) => e?.toJson())?.toList(),
    };
