import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/presentation/navigation/Routes.dart';
import 'package:flutter_template/presentation/resources/AppStyles.dart';
import 'package:flutter_template/presentation/screens/ErrorScreen.dart';
import 'package:flutter_template/presentation/screens/town/CitySelectionScreen.dart';
import 'package:flutter_template/presentation/screens/SplashScreen.dart';
import 'package:flutter_template/presentation/utils/AppLocalizations.dart';

/**
 * Widget containing main app
 */
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        title: "MainApp",
        theme: AppStyles.appTheme,
        home: SplashScren(
          title: "",
        ),
        supportedLocales:
            LangCodes.values.map((LangCodes e) => Locale(e.toCode())).toList(),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routes: {
          Routes.splash: (cntxt) => SplashScren(title: ""),
          Routes.cities: (cntxt) => CitySelectionScreen(title: ""),
          Routes.error: (cntxt) => ErrorScreen(title: ""),
        });
  }
}
