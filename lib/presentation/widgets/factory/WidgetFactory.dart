import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';

abstract class WidgetFactory {

  static Future buildDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context).translate("app_name")),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                      AppLocalizations.of(context).translate("action_no"))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();

                    AppNavigator.closeAll(context);
                  },
                  child: Text(
                      AppLocalizations.of(context).translate("action_yes")))
            ],
          );
        });
  }
}
