import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/iso/ISOCityModel.dart';
import 'package:flutter_template/common/models/weather/ForecastListModel.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatefulScreen.dart';
import 'package:flutter_template/presentation/widgets/forecast/ForecastAnimationWidget.dart';
import 'package:flutter_template/presentation/widgets/forecast/ForecastTabWidget.dart';

/**
 * Screen that displays forecast info grouped into 4-hour chunks
 */
class ForecastScreen extends BaseStatefulScreen {
  final ISOCityModel place;
  final ForecastListModel forecast;

  const ForecastScreen(
      {@required this.place,
      @required this.forecast,
      String title = "",
      Key key})
      : assert(place != null),
        assert(forecast != null),
        super(title: title, key: key);

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

/**
 * Companion state class
 */
class _ForecastScreenState extends BaseStatefulScreenState<ForecastScreen>
    with TickerProviderStateMixin {
  TabController _ctrl;
  int _page = 0;

  _ForecastScreenState() : super();

  @override
  void initState() {
    super.initState();

    this._initController();
  }

  void _initController() {
    this._ctrl = TabController(
        length: this.widget.forecast.forecasts.length, vsync: this);

    this._ctrl.addListener(() {
      this.setState(() {
        this._page = _ctrl.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    this._freeController();
  }

  void _freeController() {
    this._ctrl?.dispose();
  }

  @override
  String getScreenTitle(BuildContext cntxt) => this.widget.place.name;

  @override
  Widget buildScreenAppBar(BuildContext cntxt) {
    return AppBar(
        title: Text(this.getScreenTitle(cntxt)),
        bottom: TabBar(
            labelStyle: AppStyles.body
                .copyWith(fontSize: 10, fontWeight: FontWeight.w500),
            labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
            controller: this._ctrl,
            tabs: this._buildTabHeaders()));
  }

  List<Widget> _buildTabHeaders() => this
      .widget
      .forecast
      .forecasts
      .map((e) => Tab(
            text: e.toHourString(),
          ))
      .toList();

  @override
  Widget buildScreenContents(BuildContext cntxt) {
    return Stack(children: [
      TabBarView(
        controller: this._ctrl,
        children: this._buildTabContents(cntxt),
      ),
      this._buildWeatherAnimation(cntxt),
    ]);
  }

  Widget _buildWeatherAnimation(BuildContext cntxt) {
    return ForecastAnimationWidget(
        this._page, this.widget.forecast.forecasts[this._page]);
  }

  List<Widget> _buildTabContents(BuildContext context) {
    return this
        .widget
        .forecast
        .forecasts
        .map((e) => ForecastTabWidget(e, this.widget.place))
        .toList();
  }
}
