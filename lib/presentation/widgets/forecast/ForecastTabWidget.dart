import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/widgets/base/BaseStatelessWidget.dart';
import 'package:flutter_template/presentation/widgets/weather/WeatherOverviewCardWidget.dart';

class ForecastTabWidget extends BaseStatelessWidget {
  final ForecastModel forecast;
  final ISOCityModel place;


  const ForecastTabWidget(@required this.forecast, @required this.place, {Key key}) : assert(forecast != null), assert(place != null), super(key: key);


  @override
  Widget buildWidgetContents(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _Dimens.MID_SPACING, vertical: _Dimens.SMALL_SPACING),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            WeatherTemperatureCardWidget(name: this.place.name, summary: this.forecast.summary, showCity: false,),
            Divider(color: AppColors.trans, height: MediaQuery.of(context).size.height / 4,),
            //WeatherDescriptionWidget(weather:  this.forecast.weather),
            WeatherWindCardWidget(this.forecast.wind),
            WeatherPressureCardWidget(this.forecast.summary),
          ],
        ),
      ),
    );
  }
}

abstract class _Dimens {
  static const double SMALL_SPACING = 8.0;
  static const double MID_SPACING = 16.0;
  static const double BIG_SPACING = 32.0;
}
