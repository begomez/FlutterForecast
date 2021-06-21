import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ISOCityListModel.g.dart';

/**
 * Model for set of cities configured according to ISO 3166 country codes
 */
@JsonSerializable(explicitToJson: true)
class ISOCityListModel extends BaseModel {
  @JsonKey(name: "list")
  final List<ISOCityModel> list;

  const ISOCityListModel(this.list) : super();

  factory ISOCityListModel.fromJson(Map<String, dynamic> json) =>
      _$ISOCityListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ISOCityListModelToJson(this);

  bool isEmpty() => this.list.isEmpty;
}
