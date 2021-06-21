import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';

class AppNoDataWidget extends StatelessWidget {
  const AppNoDataWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(AppLocalizations.of(context).translate("error_no_data")),
    );
  }
}
