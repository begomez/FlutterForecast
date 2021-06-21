// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ISOCityListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ISOCityListModel _$ISOCityListModelFromJson(Map<String, dynamic> json) {
  return ISOCityListModel(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : ISOCityModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ISOCityListModelToJson(ISOCityListModel instance) =>
    <String, dynamic>{
      'list': instance.list?.map((e) => e?.toJson())?.toList(),
    };
