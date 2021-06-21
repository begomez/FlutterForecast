import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/data/api/IWeatherApi.dart';
import 'package:flutter_template/data/repo/WeatherRepositoryImpl.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/dto/WeatherDTO.dart';
import 'package:flutter_template/domain/repo/IWeatherRepository.dart';

import 'core/BaseBloc.dart';

class CurrentWeatherBloc extends BaseBloc<WeatherDTO, ForecastModel> {
  IWeatherRepository _repo;

  CurrentWeatherBloc(IWeatherApi api) : super() {
    this._repo = WeatherRepositoryImpl(api);
  }

  @override
  Future<ForecastModel> fetchData(WeatherDTO dto) async {
    return await this._repo.getCurrentWeather(dto.settings);
  }

  @override
  int getErrorCode() => ErrorCodes.CURRENT_WEATHER_ERROR;
}
