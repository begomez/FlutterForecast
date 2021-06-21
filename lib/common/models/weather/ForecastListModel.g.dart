// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ForecastListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastListModel _$ForecastListModelFromJson(Map<String, dynamic> json) {
  return ForecastListModel(
    (json['list'] as List)
        ?.map((e) => e == null
            ? null
            : ForecastModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ForecastListModelToJson(ForecastListModel instance) =>
    <String, dynamic>{
      'list': instance.forecasts?.map((e) => e?.toJson())?.toList(),
    };
