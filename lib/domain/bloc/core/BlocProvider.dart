import 'package:flutter/material.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';

/**
 * Class used to inject BLoC's across the widget tree
 * Generic class receiving:
 * -TargetBloc: bloc to be injected
 */
class BlocProvider<TargetBloc extends BaseBloc> extends StatefulWidget {
  final Widget child;
  final TargetBloc bloc;

  const BlocProvider({@required this.child, @required this.bloc, Key key})
      : assert(child != null),
        assert(bloc != null),
        super(key: key);

  static TargetBloc of<TargetBloc extends BaseBloc>(BuildContext cntxt) {
    final candidate =
        cntxt.findAncestorWidgetOfExactType<BlocProvider<TargetBloc>>();
    return candidate.bloc;
  }

  @override
  State<StatefulWidget> createState() => _BlocProviderState();
}

/**
 * Companion state obj
 */
class _BlocProviderState extends State<BlocProvider> {
  _BlocProviderState() : super();

  @override
  Widget build(BuildContext context) {
    return this.widget.child;
  }

  @override
  void dispose() {
    this.widget.bloc.dispose();

    super.dispose();
  }
}
