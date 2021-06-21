import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/CountryModel.dart';
import 'package:flutter_template/network/response/core/BaseResponse.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ISOCitiesResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ISOCitiesResponse extends BaseResponse {
  @JsonKey(name: "list")
  final List<ISOCityModel> list;

  const ISOCitiesResponse(this.list) : super();

  factory ISOCitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ISOCitiesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ISOCitiesResponseToJson(this);
}
