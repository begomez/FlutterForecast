import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/screens/base/ScreenMixin.dart';
import 'package:flutter_template/presentation/widgets/town/CitySelectionWidget.dart';

/**
 * Screen that displays a list of clickable cities
 */
class CitySelectionScreen extends BaseStatelessScreen {
  const CitySelectionScreen({String title = "", Key key})
      : super(key: key, title: title);

  @override
  Widget buildScreenContents(BuildContext cntxt) {
    return Container(
      padding: EdgeInsets.all(ScreenMixin.MID_SPACING),
      child: CitySelectionWidget());
  }
}
