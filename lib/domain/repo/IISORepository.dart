import 'package:flutter_template/common/models/iso/ISOCityListModel.dart';

/**
 * Abstraction of ISO city repo
 */
abstract class IISORepository {
  Future<ISOCityListModel> getCities();
}
