import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/domain/bloc/CurrentWeatherBloc.dart';
import 'package:flutter_template/domain/dto/WeatherDTO.dart';
import 'package:flutter_template/network/api/WeatherApiImpl.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatefulWidgetWithBloc.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppNoDataWidget.dart';
import 'package:flutter_template/presentation/widgets/weather/WeatherOverviewCardWidget.dart';

class CurrentWeatherWidget
    extends BaseStatefulWidgetWithBloc<CurrentWeatherBloc> {
  final ISOCityModel place;

  const CurrentWeatherWidget({@required this.place, Key key})
      : assert(place != null),
        super(key: key);

  @override
  _CurrentWeatherWidgetState createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends BaseStatefulWidgetWithBlocState<
    CurrentWeatherWidget, CurrentWeatherBloc, ForecastModel, WeatherDTO> {
  _CurrentWeatherWidgetState()
      : super(autocall: true, bloc: CurrentWeatherBloc(WeatherApiImpl()));

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildCard(cntxt, ForecastModel());
  }

  @override
  Widget buildSuccess(BuildContext cntxt, ForecastModel data) {
    return this._buildCard(cntxt, data);
  }

  Widget _buildCard(BuildContext cntxt, ForecastModel data) {
    if (data.validate()) {
      return WeatherOverviewCardWidget(this.widget.place, data);
    } else {
      return AppNoDataWidget();
    }
  }

  @override
  WeatherDTO getDTO() {
    return WeatherDTO(ForecastSettingsModel(city: this.widget.place));
  }
}
