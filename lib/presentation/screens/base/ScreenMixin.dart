import 'package:flutter/material.dart';

/**
 * Mixin used to abstract screen layout
 */
mixin ScreenMixin {
  static const double SMALL_SPACING = 8.0;
  static const double MID_SPACING = 16.0;
  static const double BIG_SPACING = 32.0;

  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: this.buildScreenAppBar(context),
      body: SafeArea(child: this.buildScreenContents(context)),
    );
  }

  /**
   * Builds a widget representing main content of the screen
   * It is an abstract method so it has to be overriden by children
   */
  Widget buildScreenContents(BuildContext cntxt);

  /**
   * Returns app bar displayed on screen
   */
  Widget buildScreenAppBar(BuildContext cntxt) {
    final title = this.getScreenTitle(cntxt);
    if (title.isNotEmpty) {
      return AppBar(
        title: Text(title),
        automaticallyImplyLeading: this.leading(),
      );
    } else {
      return null;
    }
  }

  /**
   * Returns title displayed in app bar, return "" to hide bar
   */
  String getScreenTitle(BuildContext cntxt);

  /**
   * Returns flag to show/hide back button on app bar
   */
  bool leading() => true;
}
