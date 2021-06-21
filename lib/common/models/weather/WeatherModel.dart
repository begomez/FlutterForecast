import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'WeatherModel.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel extends BaseModel {
  static const ICON_PLACEHOLDER = "{{icon}}";
  static const String BASE_URL = "https://openweathermap.org/img/wn/$ICON_PLACEHOLDER.png";

  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "main")
  final String main;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "icon")
  final String icon;

  const WeatherModel(
      {this.id = 0, this.main = "", this.description = "", this.icon = ""})
      : super();

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);

  bool hasIcon() => this.icon.isNotEmpty;

  String toImg() => this.hasIcon()? BASE_URL.replaceAll(ICON_PLACEHOLDER, this.icon) : "";

  @override
  bool validate() {
    return this.id > 0 && this.main.isNotEmpty && this.description.isNotEmpty;
  }
}
