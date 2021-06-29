import 'package:flutter/material.dart';

/**
 * Base class for widgets with dynamic state that uses NO bloc.
 * When needing bloc usage, see BaseStatefulWidgetWithBloc
 */
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key key}) : super(key: key);

  @override
  BaseStatefulWidgetState createState();
}

/**
 * Companion state class
 * It is a generic class receiving:
 * - T: widget binded to this state
 */
abstract class BaseStatefulWidgetState<T extends BaseStatefulWidget>
    extends State<T> {
  BaseStatefulWidgetState() : super();

  @override
  Widget build(BuildContext context) {
    return this.buildWidgetContents(context);
  }

  /**
   * Returns widget content.
   * It is an abstract method so it has to be overriden by children
   */
  Widget buildWidgetContents(BuildContext context);
}
