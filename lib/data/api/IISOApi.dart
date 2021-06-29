import 'package:flutter_template/network/response/ISOCitiesResponse.dart';

/**
 * Abstraction for ISO city API
 */
abstract class IISOApi {
  Future<ISOCitiesResponse> getCities();
}
