import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/screens/base/ScreenMixin.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';
import 'package:flutter_template/presentation/widgets/weather/WeatherMainWidget.dart';

/**
 * Main screen displayed after city selection
 */
class WeatherScreen extends BaseStatelessScreen {
  ISOCityModel place;

  WeatherScreen({this.place, String title = "", Key key})
      : assert(place != null),
        super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) => Container(
      padding: EdgeInsets.all(ScreenMixin.MID_SPACING),
      child: WeatherMainWidget(this.place));

  @override
  String getScreenTitle(BuildContext cntxt) =>
      AppLocalizations.of(cntxt).translate("app_name");

  @override
  bool leading() => true;
}
