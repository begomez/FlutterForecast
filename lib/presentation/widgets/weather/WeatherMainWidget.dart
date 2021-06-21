import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/ForecastListModel.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatefulWidget.dart';
import 'package:flutter_template/presentation/widgets/forecast/ForecastButtonWidget.dart';
import 'package:flutter_template/presentation/widgets/town/CityDropdownWidget.dart';
import 'package:flutter_template/presentation/widgets/weather/CurrentWeatherWidget.dart';

/**
 * Home screen displayed after login
 */
class WeatherMainWidget extends BaseStatefulWidget {
  final ISOCityModel place;

  const WeatherMainWidget(this.place, {Key key})
      : assert(place != null),
        super(key: key);


  @override
  BaseStatefulWidgetState<BaseStatefulWidget> createState() => _WeatherMainWidgetState(this.place);

}

class _WeatherMainWidgetState extends BaseStatefulWidgetState<WeatherMainWidget> {
  ISOCityModel _city;

  _WeatherMainWidgetState(this._city) : super();

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        this._buildSelector(context),
        this._buildCurrentWeather(context),
        this._buildMainAction(context),
      ],
    );
  }

  Widget _buildSelector(BuildContext cntxt) {
    return CityDropdownWidget(key: ValueKey(this._city.code), place: this._city, selectionCallback: this._onCityUpdated,);
  }

  Widget _buildCurrentWeather(BuildContext cntxt) {
    return Container(
      alignment: Alignment.center,
      child: CurrentWeatherWidget(
        key: ValueKey(this._city.code),
        place: this._city,
      ),
    );
  }

  Widget _buildMainAction(BuildContext cntxt) {
    return ForecastButtonWidget(
        this._city,
        onSuccess: this._onSuccess,
        onError: this._onError,
    );
  }

  void _onCityUpdated(ISOCityModel city) {
    this.setState(() {
      this._city = city;
    });
  }

  @override
  String getScreenTitle(BuildContext cntxt) =>
      AppLocalizations.of(cntxt).translate("screen_home");

  @override
  bool leading() => false;

  void _onSuccess(ForecastListModel forecast) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AppNavigator.toForecast(this.context, this._city, forecast);
    });
  }

  void _onError() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AppNavigator.toError(this.context);
    });
  }
}
