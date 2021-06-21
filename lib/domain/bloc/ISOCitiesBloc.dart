import 'package:flutter_template/common/models/iso/ISOCityListModel.dart';
import 'package:flutter_template/data/api/IISOApi.dart';
import 'package:flutter_template/data/repo/IISORepositoryImpl.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/dto/ISOCitiesDTO.dart';
import 'package:flutter_template/domain/repo/IISORepository.dart';

class ISOCitiesBloc extends BaseBloc<ISOCitiesDTO, ISOCityListModel> {
  IISORepository _repo;

  ISOCitiesBloc(IISOApi api) {
    this._repo = IISORepositoryImpl(api);
  }

  @override
  Future<ISOCityListModel> fetchData(ISOCitiesDTO dto) async {
    return await this._repo.getCities();
  }

  @override
  int getErrorCode() => ErrorCodes.ISO_CITIES_ERROR;
}
