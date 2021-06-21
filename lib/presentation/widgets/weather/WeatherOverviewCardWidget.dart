import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/common/models/weather/ForecastSummaryModel.dart';
import 'package:flutter_template/common/models/weather/WeatherModel.dart';
import 'package:flutter_template/common/models/weather/WindModel.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatelessWidget.dart';

class WeatherOverviewCardWidget extends BaseStatelessWidget {
  final ISOCityModel place;
  final ForecastModel forecast;

  const WeatherOverviewCardWidget(this.place, this.forecast, {Key key}) : super();

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Card(
      elevation: _Dimens.ELEVATION,
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(vertical: _Dimens.SMALL_SPACING, horizontal: _Dimens.MID_SPACING),
        padding: EdgeInsets.all(_Dimens.MID_SPACING),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: WeatherTemperatureCardWidget(name: this.place.name, summary: this.forecast.summary)),
            Flexible(child: WeatherDescriptionCardWidget(weather: this.forecast.weather))
          ],
        ),
      ),
    );
  }
}

/**
 * Helper widget to display temp
 */
class WeatherTemperatureCardWidget extends BaseStatelessWidget {
  final String name;
  final ForecastSummaryModel summary;
  final bool showCity;

  const WeatherTemperatureCardWidget({@required this.name, @required this.summary, this.showCity = true, Key key}) : assert(summary != null), super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (this.showCity) this._buildCardTitle(context),
        this._buildCardSubtitle(context),
        this._buildCardBody(context)
      ],
    );
  }

  Widget _buildCardTitle(BuildContext cntxt) {
    return Text(
      this.name,
      style: AppStyles.title,
    );
  }

  Widget _buildCardSubtitle(BuildContext cntxt) {
    return Text(
      this.summary.getTemp(),
      style: AppStyles.temp,
    );
  }

  Widget _buildCardBody(BuildContext cntxt) {
    return Text(
        "${AppLocalizations.of(cntxt).translate("msg_feels_like")} ${this.summary.feeling}");
  }
}

/**
 * Helper widget to display descrip
 */
class WeatherDescriptionCardWidget extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDescriptionCardWidget({@required this.weather, Key key}) : assert(weather != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        this._buildCardDescrip(context),
        if (this.weather.hasIcon()) this._buildCardIcon(context)
      ],
    );
  }

  Widget _buildCardDescrip(BuildContext cntxt) {
    return RichText(textAlign: TextAlign.right, text: TextSpan(text: this.weather.description.toUpperCase(), style: AppStyles.subtitle,));
  }

  Widget _buildCardIcon(BuildContext cntxt) {
    return Image.network(this.weather.toImg());
  }
}

/**
 * Helper widget to display wind
 */
class WeatherWindCardWidget extends BaseStatelessWidget {
  final WindModel wind;

  const WeatherWindCardWidget(this.wind, {Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Card(
        elevation: _Dimens.ELEVATION,
        child: Container(
          padding: EdgeInsets.all(_Dimens.MID_SPACING),
          margin: EdgeInsets.all(_Dimens.MID_SPACING),
          width: double.maxFinite,
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context).translate("label_wind"), style: AppStyles.title,),
              this._buildSpeed(context),
              this._buildDeg(context),
            ],
          ),
        ));
  }

  Widget _buildSpeed(BuildContext context) {
    return _buildKeyValueRow(context, "label_speed", this.wind.speed);

  }

  Widget _buildDeg(BuildContext context) {
    return _buildKeyValueRow(context, "label_deg", this.wind.deg.toDouble());
  }
}

/**
 * Helper widget to display temperatures difference
 */
class WeatherPressureCardWidget extends BaseStatelessWidget {
  final ForecastSummaryModel summary;

  const WeatherPressureCardWidget(this.summary, {Key key}) : super(key: key);

  @override
  Widget buildWidgetContents(BuildContext context) {
    return Card(
        elevation: _Dimens.ELEVATION,
        child: Container(
          padding: EdgeInsets.all(_Dimens.MID_SPACING),
          margin: EdgeInsets.all(_Dimens.MID_SPACING),
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context).translate("label_more_info"), style: AppStyles.title,),
              _buildKeyValueRow(context, "label_pressure", this.summary.pressure.toDouble()),
              _buildKeyValueRow(context, "label_humid", this.summary.humid.toDouble()),
            ],
          ),
        ));
  }


}

Widget _buildKeyValueRow(BuildContext context, String label, double value) {
  return Padding(
    padding: EdgeInsets.only(left: _Dimens.MID_SPACING),
    child: RichText(text: TextSpan(
      children: [
        TextSpan(text: AppLocalizations.of(context).translate(label), style: AppStyles.subtitle),
        TextSpan(text: ": "),
        TextSpan(text: value.toString(), style: AppStyles.body)
      ],
    ),),
  );
}



abstract class _Dimens {
  static const double ELEVATION = 10.0;
  static const double SMALL_SPACING = 8.0;
  static const double MID_SPACING = 12.0;
  static const double BIG_SPACING = 32.0;
}
