
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/weather/ForecastModel.dart';

class ForecastAnimationWidget extends StatefulWidget {
  final int pos;
  final ForecastModel forecast;

  
  const ForecastAnimationWidget(this.pos, this.forecast) : super();

  _ForecastAnimationWidgetState createState() => _ForecastAnimationWidgetState();
}

class _ForecastAnimationWidgetState extends State<ForecastAnimationWidget> {
  _ForecastAnimationWidgetState() : super();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(ForecastAnimationWidget old) {
    super.didUpdateWidget(old);
  }

  @override
  Widget build(BuildContext cntxt) {
    final INITIAL_OFFSET = 25.0;
    final ANIM_DURATION_IN_SECS = 1;
    final COLOR_STEP = 0.1;

    return AnimatedContainer(
        padding: EdgeInsets.all(_Dimens.MID_SPACING),
        duration: Duration(seconds: ANIM_DURATION_IN_SECS),
        width: double.maxFinite,
        color: Colors.grey.withOpacity(min(1.0, COLOR_STEP * this.widget.pos)),
        height: MediaQuery.of(cntxt).size.height / 3,
        child: Stack(
            children: [
              AnimatedPositioned(
                  width: _Dimens.CONTAINER_SIZE,
                  height: _Dimens.CONTAINER_SIZE,
                  top: this.widget.pos * INITIAL_OFFSET,
                  duration: Duration(seconds: ANIM_DURATION_IN_SECS),
                  child: this._buildStar(cntxt)
              )
            ]
        )
    );
  }

  Widget _buildStar(BuildContext cntxt) => Container(
      width: _Dimens.CONTAINER_SIZE,
      height: _Dimens.CONTAINER_SIZE, decoration: BoxDecoration(color: Colors.yellow, shape: BoxShape.circle));
}

abstract class _Dimens {
  static const double CONTAINER_SIZE = 100.0;
  static const double SMALL_SPACING = 8.0;
  static const double MID_SPACING = 16.0;
  static const double BIG_SPACING = 32.0;
}
