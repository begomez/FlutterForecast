import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ForecastSummaryModel.g.dart';

/**
  * Model for forecast summary in weather module
 */
@JsonSerializable(explicitToJson: true)
class ForecastSummaryModel extends BaseModel {
  @JsonKey(name: "temp")
  final double temp;
  @JsonKey(name: "feels_like")
  final double feeling;
  @JsonKey(name: "temp_min")
  final double minTemp;
  @JsonKey(name: "temp_max")
  final double maxTemp;
  @JsonKey(name: "pressure")
  final int pressure;
  @JsonKey(name: "humidity")
  final int humid;

  const ForecastSummaryModel(
      {this.temp = .0,
      this.feeling = .0,
      this.minTemp = .0,
      this.maxTemp = .0,
      this.pressure = 0,
      this.humid = 0})
      : super();

  factory ForecastSummaryModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastSummaryModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastSummaryModelToJson(this);

  @override
  bool validate() => this.temp > 0.0 && this.feeling > 0.0;

  double toFah(int deg) => ((deg * 9/5) + 32);

  String getTemp({bool suffix = true}) => this.temp.toString() + (suffix? this.getSuffix() : "");

  String getSuffix() => "º";
}
