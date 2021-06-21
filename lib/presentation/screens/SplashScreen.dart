import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/navigation/AppNavigator.dart';
import 'package:flutter_template/presentation/resources/AppColors.dart';
import 'package:flutter_template/presentation/screens/base/BaseStatefulScreen.dart';

/**
 * Initial/launch screen
 */
class SplashScren extends BaseStatefulScreen {
  const SplashScren({String title = "", Key key})
      : super(title: title, key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

/**
 * Companion state class
 */
class _SplashScreenState extends BaseStatefulScreenState<SplashScren>
    with TickerProviderStateMixin {
  final ANIM_DURATION = 2;
  AnimationController _ctrl;

  _SplashScreenState() : super();

  @override
  void initState() {
    this._ctrl = AnimationController(
        upperBound: 0.75,
        lowerBound: 0.25,
        vsync: this,
        duration: Duration(seconds: ANIM_DURATION));

    this._ctrl.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        this._navigateDelayed(this.context);
      }
    });

    this._ctrl.forward();

    super.initState();
  }

  @override
  void dispose() {
    this._ctrl?.dispose();
    super.dispose();
  }

  @override
  Widget buildScreenContents(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [AppColors.primary, AppColors.primaryDark])),
      child: ScaleTransition(
          scale: this._ctrl,
          child: Image.asset("assets/images/splash.png")),
    );
  }

  void _navigateDelayed(BuildContext cntxt) async {
    final int DELAY_IN_SECS = 2;

    await Future.delayed(Duration(seconds: DELAY_IN_SECS))
        .then((value) async => await AppNavigator.toCitySelection(cntxt));
  }
}
