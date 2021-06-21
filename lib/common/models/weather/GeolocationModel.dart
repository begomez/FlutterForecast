import 'package:json_annotation/json_annotation.dart';

import '../core/BaseModel.dart';

part 'GeolocationModel.g.dart';

/**
  * Model for geolocation fix in weather module
 */
@JsonSerializable(explicitToJson: true)
class GeolocationModel extends BaseModel {
  @JsonKey(name: "lat")
  final double lat;
  @JsonKey(name: "lon")
  final double lon;

  const GeolocationModel({this.lat = 0.0, this.lon = 0.0}) : super();

  factory GeolocationModel.empty() => GeolocationModel();

  factory GeolocationModel.fromJson(Map<String, dynamic> json) =>
      _$GeolocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeolocationModelToJson(this);

  @override
  bool validate() {
    return this.lat != 0.0 && this.lon != 0.0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeolocationModel &&
          runtimeType == other.runtimeType &&
          lat == other.lat &&
          lon == other.lon;

  @override
  int get hashCode => lat.hashCode ^ lon.hashCode;
}
