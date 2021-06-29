import 'package:flutter_template/common/models/core/BaseModel.dart';

/**
 * Model wrapping a flag
 */
class BooleanWrapper extends BaseModel {
  final bool flag;

  const BooleanWrapper({this.flag = false}) : super();
}
