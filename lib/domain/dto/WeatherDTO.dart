import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/domain/dto/core/BaseDTO.dart';

class WeatherDTO extends BaseDTO {
  final ForecastSettingsModel settings;

  const WeatherDTO(this.settings) : super();
}
