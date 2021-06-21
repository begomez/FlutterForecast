import 'package:flutter_template/network/response/ISOCitiesResponse.dart';

abstract class IISOApi {
  Future<ISOCitiesResponse> getCities();
}
