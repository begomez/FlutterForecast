import 'package:flutter_template/network/request/core/BaseRequest.dart';

enum RequestType { BY_NAME, BY_ID, BY_ZIP, BY_LOC }

class ForecastRequest extends BaseRequest {
  int appId;
  int cityId;
  int zip;
  double lat;
  double lon;
  RequestType type;

  ForecastRequest(
      {this.appId = 0,
      this.cityId = 0,
      this.zip = 0,
      this.lat = .0,
      this.lon = .0,
      this.type = RequestType.BY_ID})
      : super();
}
