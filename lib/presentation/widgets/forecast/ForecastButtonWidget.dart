import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/ForecastListModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSettingsModel.dart';
import 'package:flutter_template/domain/bloc/ForecastBloc.dart';
import 'package:flutter_template/domain/dto/WeatherDTO.dart';
import 'package:flutter_template/network/api/WeatherApiImpl.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatefulWidgetWithBloc.dart';

class ForecastButtonWidget extends BaseStatefulWidgetWithBloc<ForecastBloc> {
  ISOCityModel place;
  Function(ForecastListModel forecast) onSuccess;
  Function() onError;

  ForecastButtonWidget(this.place, {this.onSuccess, this.onError, Key key})
      : super(key: key);

  @override
  _ForecastButtonWidgetState createState() => _ForecastButtonWidgetState();
}

class _ForecastButtonWidgetState extends BaseStatefulWidgetWithBlocState<
    ForecastButtonWidget, ForecastBloc, ForecastListModel, WeatherDTO> {
  _ForecastButtonWidgetState()
      : super(autocall: false, bloc: ForecastBloc(WeatherApiImpl()));

  @override
  Widget buildInitial(BuildContext cntxt) {
    return this._buildActionBtn(cntxt);
  }

  @override
  Widget buildSuccess(BuildContext cntxt, ForecastListModel data) {
    if (data.validate()) {
      this.widget.onSuccess?.call(data);
    }

    return this._buildActionBtn(cntxt);
  }

  @override
  Widget buildError(BuildContext cntxt, ErrorModel err) {
    this.widget.onError?.call();

    return this._buildActionBtn(cntxt);
  }

  Widget _buildActionBtn(BuildContext cntxt) {
    return Container(
      width: double.maxFinite,
      child: ElevatedButton(
          onPressed: () {
            this.call();
          },
          child: Text(
            AppLocalizations.of(cntxt).translate("action_forecast"),
            style: AppStyles.action,
          )),
    );
  }

  @override
  WeatherDTO getDTO() {
    return WeatherDTO(ForecastSettingsModel(city: this.widget.place));
  }
}
