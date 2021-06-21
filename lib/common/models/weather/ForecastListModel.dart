import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/weather/CountryModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/common/models/weather/GeolocationModel.dart';
import 'package:flutter_template/common/models/weather/HourlyForecastModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ForecastListModel.g.dart';

/**
  * Model for forecast list in weather module
 */
@JsonSerializable(explicitToJson: true)
class ForecastListModel extends BaseModel {
 
  @JsonKey(name: "list")
  final List<ForecastModel> forecasts;

  const ForecastListModel(this.forecasts) : super();

  factory ForecastListModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastListModelToJson(this);

  @override
  bool validate() => this.forecasts.isNotEmpty;
}
