import 'package:flutter/material.dart';
import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/result/ResourceResult.dart';
import 'package:flutter_template/domain/bloc/core/BaseBloc.dart';
import 'package:flutter_template/domain/bloc/core/BlocProvider.dart';
import 'package:flutter_template/domain/dto/core/BaseDTO.dart';

/**
 * Mixin used to hook BLoC functionality on widgets.
 * It is a generic class receiving:
 * - TargetBloc: bloc used by the mixin
 * - TargetData: data model returned by previous bloc
 * - TargetDTO: params model used as previous bloc input
 */
mixin BlocMixin<TargetBloc extends BaseBloc, TargetData extends BaseModel,
    TargetDTO extends BaseDTO> {
  TargetBloc _bloc;
  bool _autocall = false;

  bool get autocall => this._autocall;

  //XXX: must be invoked since mixins have no constructors
  void initMixin({TargetBloc bloc, bool autocall}) {
    this._bloc = bloc;
    this._autocall = autocall;
  }

  /**
   * Perform bloc operation
   */
  void call() {
    TargetDTO dto = this.getDTO();

    // BLOC initialized
    if (this.hasBloc()) {
      // show loading
      this._bloc.processNewEvent(
          ResourceResult<TargetData>(resState: ResourceState.LOADING));

      // perform op
      this._bloc.performOperation(dto);

      // NO BLOC available
    } else {
      throw UnimplementedError("No bloc available in mixin");
    }
  }

  bool hasBloc() => (this._bloc != null);

  /**
   * Returns a widget depending on current state
   */
  Widget buildWidgetAccordingToState(BuildContext context) {
    return BlocProvider(
        child: StreamBuilder<ResourceResult<TargetData>>(
          stream: this._bloc.output,
          builder: (context, snap) {
            switch (snap?.data?.resState) {
              case ResourceState.LOADING:
                return this.buildLoading(context);
              case ResourceState.ERROR:
                return this.buildError(context, snap.data.error);
              case ResourceState.SUCCESS:
                return this.buildSuccess(context, snap.data.data);
              case ResourceState.INITIAL:
              default:
                return this.buildInitial(context);
            }
          },
        ),
        bloc: this._bloc);
  }

  /**
   * Widget to show when bloc is working
   */
  Widget buildLoading(BuildContext cntxt);

  /**
   * Widget to show when bloc fails
   */
  Widget buildError(BuildContext cntxt, ErrorModel err);

  /**
   * Widget to show when idle
   */
  Widget buildInitial(BuildContext cntxt);

  /**
   * Widget to show when operations finishes with no error
   */
  Widget buildSuccess(BuildContext cntxt, TargetData data);

  /**
   * Returns object used as bloc input.
   */
  TargetDTO getDTO();
}
