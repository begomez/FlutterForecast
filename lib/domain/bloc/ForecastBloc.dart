import 'package:flutter_template/common/models/weather/ForecastListModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/data/api/IWeatherApi.dart';
import 'package:flutter_template/data/repo/WeatherRepositoryImpl.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/dto/WeatherDTO.dart';
import 'package:flutter_template/domain/repo/IWeatherRepository.dart';

class ForecastBloc extends BaseBloc<WeatherDTO, ForecastListModel> {
  IWeatherRepository _repo;

  ForecastBloc(IWeatherApi _api) {
    this._repo = WeatherRepositoryImpl(_api);
  }

  @override
  Future<ForecastListModel> fetchData(WeatherDTO dto) async {
    final rawData =  await this._repo.getForecasting(dto.settings);
    
    return ForecastListModel(this._prepareData(rawData));
  }

  /**
   * Split 24h day forecast into 8 segments of 4 hours by skipping in between vals
   */
  List<ForecastModel> _prepareData(ForecastListModel rawData) {
    final int SEGMENT = 4;
    List<ForecastModel> ret = [];

    for (var i = 0; i < rawData.forecasts.length; i++) {
      if (i % SEGMENT != 0) {
        continue;
      }

      ret.add(rawData.forecasts[i]);
    }

    return ret;
  }

  @override
  int getErrorCode() {
    return ErrorCodes.FORECAST_ERROR;
  }
}
