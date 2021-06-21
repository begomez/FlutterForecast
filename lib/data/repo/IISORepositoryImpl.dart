import 'package:flutter_template/common/models/iso/ISOCityListModel.dart';
import 'package:flutter_template/data/api/IISOApi.dart';
import 'package:flutter_template/domain/repo/IISORepository.dart';

class IISORepositoryImpl implements IISORepository {
  final IISOApi _api;

  const IISORepositoryImpl(this._api);

  Future<ISOCityListModel> getCities() async {
    final resp = await this._api.getCities();

    return ISOCityListModel(resp.list);
  }
}
