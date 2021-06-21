import 'package:flutter_template/common/models/iso/ISOCityListModel.dart';

abstract class IISORepository {
  Future<ISOCityListModel> getCities();
}
