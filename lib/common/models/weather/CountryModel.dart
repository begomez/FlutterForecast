import 'package:json_annotation/json_annotation.dart';

import '../core/BaseModel.dart';

part 'CountryModel.g.dart';

/**
 * Model for country in weather module
 */
@JsonSerializable(explicitToJson: true)
class CountryModel extends BaseModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "country")
  final String country;
  @JsonKey(name: "sunrise")
  final int sunrise;
  @JsonKey(name: "sunset")
  final int sunset;

  const CountryModel(
      {this.id = -1, this.country = "", this.sunrise = 0, this.sunset = 0});

  factory CountryModel.empty() => CountryModel();

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  @override
  bool validate() {
    return this.id > 0 && this.country.isNotEmpty;
  }
}
