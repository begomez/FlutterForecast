import 'dart:math';

import 'package:flutter_template/common/factory/FakeModelFactory.dart';
import 'package:flutter_template/data/api/IISOApi.dart';
import 'package:flutter_template/network/response/ISOCitiesResponse.dart';

class FakeISOApiImpl implements IISOApi {
  @override
  Future<ISOCitiesResponse> getCities() async {
    return Future.delayed(Duration(seconds: Random().nextInt(2)))
        .then((val) => ISOCitiesResponse(FakeModelFactory.isoCities()));
  }
}
