import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatelessScreen.dart';
import 'package:flutter_template/presentation/widgets/convenient/AppNoDataWidget.dart';

class ErrorScreen extends BaseStatelessScreen {

  const ErrorScreen({String title = "", Key key}) : super(title: title, key: key);

  @override
  Widget buildScreenContents(BuildContext context) {
    return AppNoDataWidget();
  }
}
